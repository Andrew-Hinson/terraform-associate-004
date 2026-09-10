# Lab 04 — Import and state CLI

**Objectives:** 7a, 7b  
**Time:** 30 min

`local_file` cannot be imported. This lab uses `random_id`, which can.

```bash
cd week-03-modules-state/labs/04-import-state
terraform init
terraform apply
terraform output import_id
terraform state list
terraform state show random_id.existing
```

Untrack, then import the same object back:

```bash
ID=$(terraform output -raw import_id)
terraform state rm random_id.existing
terraform state list   # empty
terraform import random_id.existing "$ID"
terraform state list
terraform plan         # no-op
```

`state rm` dropped tracking only. The id value is unchanged because you imported the same ID.

Then try the `import` block in `import.tf`: `state rm` again, uncomment the block, paste `id`, `terraform plan` (import action), `terraform apply`.

**Exam takeaway:** import binds a real ID to an address. Config must exist. `state rm` ≠ destroy. `state mv` / `moved` rename addresses. Not every resource type implements import.
