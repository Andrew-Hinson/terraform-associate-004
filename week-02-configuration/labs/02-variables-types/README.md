# Lab 02 — Variables and complex types

**Objectives:** 4c, 4d  
**Time:** 25 min

`terraform.tfvars` supplies valid defaults. Override to see validation fail.

```bash
cd week-02-configuration/labs/02-variables-types
terraform init
terraform apply
terraform apply -var='env=nope'
# expect variable validation error
```

Inspect `terraform.tfstate` for the output. Then:

```bash
terraform output
terraform output -json
```

**Exam takeaway:** types + validation catch bad input at plan time. `map` / `object` / `list` are fair game on the exam. Root `-var` values do not leak into modules unless you pass them.
