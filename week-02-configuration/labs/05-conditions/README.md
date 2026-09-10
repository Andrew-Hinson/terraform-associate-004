# Lab 05 — Custom conditions

**Objectives:** 4g  
**Time:** 25 min

```bash
cd week-02-configuration/labs/05-conditions
terraform init
terraform apply -var='body=ok'
terraform apply -var='body='
# expect precondition / validation failure
```

Then apply with `body=forbidden` and watch the output precondition fail.

**Exam takeaway:** `validation` guards variable values. `precondition` runs before the action. `postcondition` uses `self` after. Failures stop the run. They do not update `ignore_changes`.
