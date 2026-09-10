# Lab 01 — Core workflow

**Objectives:** 3a–3g  
**Time:** 30–40 min

Creates a local file with Terraform. Watch which files appear after each command.

```bash
cd week-01-workflow/labs/01-core-workflow

terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
ls -la
cat hello.txt
cat terraform.tfstate | head

terraform destroy
ls hello.txt || echo "file gone"
```

Write down:

1. Which command created `.terraform/` and `terraform.lock.hcl`
2. Which command created `hello.txt` and `terraform.tfstate`
3. Whether `validate` mentioned the file on disk (it should not)

**Exam takeaway:** `init` prepares the working directory. `validate` never talks to the real world. `apply` changes the real world and state. `destroy` removes managed objects.
