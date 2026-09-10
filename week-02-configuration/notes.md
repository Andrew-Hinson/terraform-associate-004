# Week 2 notes — domain 4

## 4a Resource vs data

```hcl
resource "local_file" "made" {
  filename = "${path.module}/made.txt"
  content  = "created by terraform\n"
}

data "local_file" "existing" {
  filename = "${path.module}/already-there.txt"
}
```

- `resource`: Terraform creates/updates/destroys the object.
- `data`: Terraform **reads** an object it does not manage.
- Data sources still run during plan/apply and can fail if the object is missing.

## 4b References

```hcl
resource "local_file" "b" {
  filename = "${path.module}/b.txt"
  content  = local_file.made.content
}
```

Address: `TYPE.NAME.ATTRIBUTE`  
Module: `module.CHILD.TYPE.NAME.ATTRIBUTE`  
Data: `data.TYPE.NAME.ATTRIBUTE`  
Ephemeral: `ephemeral.TYPE.NAME.ATTRIBUTE`

A reference creates an **implicit** dependency. Terraform builds the graph from those.

Prefer bare refs (`local_file.made.content`) over `"${...}"` unless you are interpolating into a string.

## 4c Variables and outputs

```hcl
variable "env" {
  type        = string
  default     = "dev"
  description = "environment name"
  sensitive   = false

  validation {
    condition     = contains(["dev", "stage", "prod"], var.env)
    error_message = "env must be dev, stage, or prod."
  }
}

output "filename" {
  value     = local_file.made.filename
  sensitive = false
}
```

**How variables get values (precedence, high last):**

1. `default` in the block
2. `terraform.tfvars` / `*.auto.tfvars`
3. `-var-file=`
4. `-var=`
5. `TF_VAR_name` environment variables

Root module variables are **not** visible inside a child module unless you pass them as module inputs.

`sensitive = true` on a variable or output redacts it in the CLI. It can still be stored in state.

## 4d Complex types

| Type | Example |
| --- | --- |
| `string` | `"prod"` |
| `number` | `3` |
| `bool` | `true` |
| `list(string)` | `["a", "b"]` — ordered, duplicates allowed |
| `set(string)` | `toset(["a", "b"])` — unordered, unique |
| `map(string)` | `{ env = "dev" }` |
| `object({...})` | named attributes, each typed |
| `tuple([...])` | fixed-length mixed types |

`for_each` wants a map or set of strings. A list must be converted (`toset`) and must have unique values.

## 4e Expressions, functions, count, for_each

**Common functions:** `length`, `lookup`, `merge`, `keys`, `values`, `flatten`, `distinct`, `join`, `split`, `replace`, `coalesce`, `try`, `can`, `toset`, `tomap`, `cidrsubnet`, `file`, `templatefile`.

```hcl
resource "local_file" "counted" {
  count    = var.enabled ? 2 : 0
  filename = "${path.module}/count-${count.index}.txt"
  content  = "i=${count.index}\n"
}

resource "local_file" "each" {
  for_each = toset(var.names)
  filename = "${path.module}/${each.key}.txt"
  content  = each.value
}
```

- `count` addresses: `local_file.counted[0]`
- `for_each` addresses: `local_file.each["alpha"]`
- Changing a list order with `count` can **replace the wrong instance**
- Changing a `for_each` key creates/destroys that key only

`count` and `for_each` cannot be used on the same resource.

## 4f Dependencies and lifecycle

**Implicit:** `content = local_file.a.content`  
**Explicit:** `depends_on = [local_file.a]` when the graph cannot see the link (provisioners, hidden API coupling). Do not sprinkle `depends_on` by habit. It serializes more of the graph.

```hcl
resource "local_file" "swap" {
  filename = "${path.module}/swap.txt"
  content  = var.body

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = [file_permission]
    replace_triggered_by  = [local_file.other]
  }
}
```

| Argument | Meaning |
| --- | --- |
| `create_before_destroy` | Create replacement first, then destroy the old one |
| `prevent_destroy` | Apply errors if the object would be destroyed |
| `ignore_changes` | Drift on those attrs is ignored |
| `replace_triggered_by` | Replace this resource when the referenced value changes |

004 called out `depends_on` and `create_before_destroy`. Know both.

## 4g Custom conditions

Three layers:

```hcl
variable "size" {
  type = number
  validation {
    condition     = var.size >= 1 && var.size <= 10
    error_message = "size must be 1-10."
  }
}

resource "local_file" "ok" {
  filename = "${path.module}/ok.txt"
  content  = var.body

  lifecycle {
    precondition {
      condition     = length(var.body) > 0
      error_message = "body must not be empty."
    }
    postcondition {
      condition     = length(self.content) > 0
      error_message = "wrote an empty file."
    }
  }
}

output "body" {
  value = var.body
  precondition {
    condition     = var.body != "forbidden"
    error_message = "forbidden body."
  }
}
```

- Variable `validation` runs when the variable is set (plan time)
- `precondition` checks before the action
- `postcondition` checks after, using `self`
- A failed condition **fails the run**. It does not ignore drift

## 4h Sensitive data, Vault, ephemeral, write-only

**Best practices:**

- Do not put secrets in `.tf` or git
- Mark variables/outputs `sensitive = true`
- Prefer a secrets manager. HashiCorp Vault is the named example: read a secret with a Vault provider / data source, do not hardcode it
- Restrict who can read state (state can contain secrets)

**Ephemeral values (1.10+ / tested on 1.12):**  
`ephemeral` blocks create temporary objects (passwords, leases). Terraform does **not** write them to state or plan files. Reference them as `ephemeral.TYPE.NAME.ATTR`. They exist for the current operation only.

**Write-only arguments:**  
Some managed resources have `*_wo` arguments (example: `password_wo` + `password_wo_version`). Terraform sends the value to the provider, then discards it. It is not stored in state. Bump the version argument when you want to write a new secret.

```hcl
ephemeral "random_password" "db" {
  length = 16
}

# Conceptual. Many cloud resources expose *_wo arguments.
# resource "some_db" "x" {
#   password_wo         = ephemeral.random_password.db.result
#   password_wo_version = 1
# }
```

**Contrast:**

| Mechanism | In state? | Purpose |
| --- | --- | --- |
| `sensitive = true` | Often yes | Redact CLI/UI |
| ephemeral resource | No | Temporary value for this run |
| write-only argument | No | Pass a secret into a managed resource |
