# Lab 06 — Sensitive, ephemeral, write-only

**Objectives:** 4h  
**Time:** 30 min

```bash
cd week-02-configuration/labs/06-sensitive-ephemeral
terraform init
terraform apply
terraform output
```

`secret` is redacted in `terraform output`. It is still in `terraform.tfstate`. Confirm with `grep` on the state file.

The `ephemeral "random_password"` value is **not** written to state. Grep state for the password. You should not find it.

Write-only arguments live on managed resources (`password_wo`, `secret_string_wo`). This lab cannot call a cloud DB. Read the commented block and the notes. Know:

1. Terraform sends the value to the provider
2. It is discarded after the operation
3. A companion `*_wo_version` tells Terraform when to write a new value

**Exam takeaway:** `sensitive` ≠ not in state. Ephemeral and write-only are the 1.12 mechanisms that keep secrets out of state/plan.
