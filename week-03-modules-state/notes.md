# Week 3 notes — domains 5 to 7

## 5 Modules

A module is a directory of `.tf` files. The **root module** is where you run Terraform. **Child modules** are called with a `module` block.

```hcl
module "label" {
  source  = "./modules/label"
  name    = "004"
  version = null # version is for registry/git, not local paths
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"
}
```

### 5a Sources

| Source | Example |
| --- | --- |
| Local | `./modules/label` or `../shared` |
| Registry | `hashicorp/consul/aws` (`namespace/name/provider`) |
| Git | `git::https://example.com/mod.git?ref=v1.2.0` |
| HTTPS / S3 / GCS | less common on the exam, know they exist |

Local paths do **not** use `version`. Registry and many git sources do.

`terraform init` downloads remote modules into `.terraform/modules`.

### 5b Variable scope

- Each module has its own `variable` and `output` blocks
- Root variables are **not** inherited
- Pass inputs: `name = var.name`
- Read outputs: `module.label.id`
- You cannot reach a child's internal resources from the root unless the child **outputs** them (or you use a data source)

### 5c Using modules

```hcl
module "label" {
  source = "./modules/label"
  name   = "web"
}

resource "local_file" "out" {
  filename = "${path.module}/id.txt"
  content  = module.label.id
}
```

`count` / `for_each` work on `module` blocks. Addresses become `module.label[0]` or `module.label["web"]`.

### 5d Versions

Pin registry modules:

```hcl
version = "1.2.3"
version = "~> 1.2"
```

`init -upgrade` can select a newer allowed module version. Commit lock file (modules are recorded there too).

## 6 State management

### 6a Local backend

Default. State file: `terraform.tfstate`. Backup: `terraform.tfstate.backup`.  
Fine for solo labs. Bad for teams: no real locking, file lives on one disk, secrets sit in a local JSON file.

```hcl
terraform {
  backend "local" {
    path = "custom.tfstate"
  }
}
```

### 6b Locking

Remote backends take a lock before write. A second `apply` waits or errors. Prevents two people corrupting state.

Local backend locking is limited (a lock file if the FS supports it). Do not treat it as team-safe.

If a run dies, you may need `terraform force-unlock LOCK_ID`. Only after you prove no apply is running.

### 6c Remote backend

```hcl
terraform {
  backend "s3" {
    bucket         = "tfstate-example"
    key            = "app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }
}
```

Other backends: `azurerm`, `gcs`, `http`, `remote` (legacy TFC), `cloud` (current HCP, week 4).

Changing backend: edit the block → `terraform init -migrate-state`.

Partial config is common: put secrets in `-backend-config=` or env vars, not git.

`terraform_remote_state` data source reads **another** state's outputs. Prefer explicit outputs + a remote data pattern over slurp-the-whole-state.

### 6d Drift

Drift = real object changed outside Terraform.

Default `plan` / `apply` **refresh** state from the API, then diff.

- Refresh sees the drift
- Plan proposes to put it back (or replace)
- `terraform apply -refresh-only` updates state to match reality without changing objects
- `ignore_changes` skips selected attributes
- If someone created an object by hand, **import** it. Do not pretend refresh will invent a new address

## 7 Maintain

### 7a Import

Config must already describe the object. Then bind a real ID to that address.

CLI:

```bash
terraform import local_file.existing ./imported.txt
```

Config (1.5+), preferred:

```hcl
import {
  to = local_file.existing
  id = "./imported.txt"
}
```

`terraform plan` with an `import` block shows an import action, then you apply. You can generate config with `terraform plan -generate-config-out=` (know the idea).

Import does **not** change the real object. It only updates state.

Not every resource type implements import. If import is unsupported, the provider errors. The exam still expects you to know the workflow: config first, then bind the ID.

### 7b State CLI

| Command | Effect |
| --- | --- |
| `terraform state list` | Addresses in state |
| `terraform state show ADDR` | Attributes |
| `terraform state mv A B` | Rename / move (refactor) |
| `terraform state rm ADDR` | Stop tracking. Object stays |
| `terraform state pull` | Dump state JSON to stdout |
| `terraform state push` | Dangerous overwrite |

`moved` blocks are the config-native cousin of `state mv`.

### 7c Verbose logging

```bash
export TF_LOG=DEBUG
export TF_LOG_PATH=./terraform.log
terraform apply
```

Levels: `TRACE` (noisiest), `DEBUG`, `INFO`, `WARN`, `ERROR`.

Use when a provider/API call fails or `init` cannot fetch a plugin. Do not enable TRACE for every apply. Logs can contain secrets. `TF_LOG_PATH` keeps them out of the terminal.

`TF_LOG_CORE` and `TF_LOG_PROVIDER` split core vs plugin logs.
