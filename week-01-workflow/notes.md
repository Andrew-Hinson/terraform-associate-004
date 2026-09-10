# Week 1 notes — domains 1 to 3

## 1 IaC with Terraform

**IaC:** infrastructure defined in files, applied by a tool, stored in version control.

Terraform is **declarative**. You describe the desired end state. Terraform computes the diff and applies it. Imperative tools list steps (`create A, then B`).

**Advantages you must be able to name:**

- Repeatable environments
- Review via pull request
- Recovery: recreate from config + state
- Documentation that matches reality (when you apply)
- Automation (CI can plan/apply)

**Multi-cloud / hybrid / service-agnostic:** Terraform itself is one binary. Cloud and SaaS APIs are reached through **providers**. One root module can talk to AWS, Azure, GitHub, and a local file in the same run. Terraform does not replace cloud IAM. Providers still need credentials.

## 2 Fundamentals

### Providers (2a–2c)

Providers are plugins. Terraform downloads them during `init` from a registry (usually `registry.terraform.io`).

Always declare:

```hcl
terraform {
  required_version = ">= 1.12.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}
```

- `source` is `namespace/name` (often `hashicorp/local`)
- `version` is a constraint: `>=`, `~>`, `=`, comma-AND ranges
- `terraform.lock.hcl` pins the **exact** plugin version and hashes. Commit it.
- `terraform init -upgrade` recalculates the lock file within constraints

**How Terraform uses providers:** each resource type belongs to a provider. Terraform starts the plugin, sends CRUD, writes results to state.

**Multiple providers / aliases:**

```hcl
provider "random" {}

provider "random" {
  alias = "extra"
}

resource "random_pet" "b" {
  provider = random.extra
}
```

The default (un-aliased) provider is used unless you set `provider = name.alias`.

### State (2d)

State is a JSON mapping of config addresses → real objects, plus attributes and dependencies.

Why it exists:

1. Map config to real IDs
2. Cache attributes so Terraform does not have to read every API every time
3. Track metadata (dependencies, create order)
4. Performance on large graphs

Default location: `terraform.tfstate` (local backend). Remote backends store it for teams and enable locking.

Deleting `terraform.tfstate` does **not** destroy infrastructure. Terraform just forgets it. Next apply may try to create duplicates.

Never hand-edit state. Use `terraform state` commands.

## 3 Core workflow

Write → `init` → (`fmt` / `validate`) → `plan` → `apply`. Destroy when you want the objects gone.

| Command | What it does | Writes |
| --- | --- | --- |
| `terraform init` | Download providers/modules, configure backend, write lock file | `.terraform/`, `terraform.lock.hcl` |
| `terraform fmt` | Rewrite HCL to canonical style | `.tf` files |
| `terraform validate` | Syntax + internal consistency. Needs `init` | Nothing |
| `terraform plan` | Refresh (usually) + diff desired vs state | Optional `-out=FILE` |
| `terraform apply` | Plan (unless given a saved plan) then create/update/destroy | State |
| `terraform destroy` | Plan a destroy, then apply it | State |

**init flags to know:**

- `-upgrade` — upgrade providers/modules within constraints
- `-reconfigure` — ignore cached backend config, re-init backend
- `-backend-config=` — partial backend config (bucket, key, etc.)
- `-migrate-state` — move state when backend changes

**plan / apply:**

- `terraform apply` without a plan file runs a new plan, then prompts
- `terraform apply plan.tfplan` applies that exact plan
- `-auto-approve` skips the prompt
- `-destroy` on plan/apply is the same graph as `destroy`
- `-refresh=false` skips the API refresh (stale view; know that it exists)

**fmt:** `terraform fmt -check -recursive` is CI-friendly. It does not validate logic.

**Workflow rule:** if providers or modules are missing, `plan` / `validate` fail. Run `init` first.
