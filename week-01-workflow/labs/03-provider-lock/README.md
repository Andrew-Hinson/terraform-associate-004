# Lab 03 — Provider versions and the lock file

**Objectives:** 2a  
**Time:** 25 min

```bash
cd week-01-workflow/labs/03-provider-lock
terraform init
cat .terraform.lock.hcl
```

Note the exact `hashicorp/random` version.

Change `version = "= 3.6.0"` to `version = "~> 3.6.0"` in `main.tf`.

```bash
terraform init
# lock file should stay on 3.6.0 until you upgrade

terraform init -upgrade
cat .terraform.lock.hcl
```

`-upgrade` picks the newest version allowed by the constraint and rewrites the lock file.

**Exam takeaway:** `required_providers` is a range. The lock file is the pin. `init` respects the lock. `init -upgrade` refreshes it.
