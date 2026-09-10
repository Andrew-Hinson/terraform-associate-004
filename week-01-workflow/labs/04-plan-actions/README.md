# Lab 04 — Plan actions: create, update, replace

**Objectives:** 2d, 3d, 3e  
**Time:** 30 min

```bash
cd week-01-workflow/labs/04-plan-actions
terraform init
terraform apply
```

1. Change `content` only. `terraform plan`  
   Expect: **update in place**.

2. Change `filename` only. `terraform plan`  
   Expect: **replace** (destroy + create). `local_file` treats filename as ForceNew.

3. Apply the replace. Confirm the old filename is gone and state lists the new address/path.

**Exam takeaway:** a plan is a set of actions (create / update / replace / delete / no-op). Replace is not the same as update. Read the plan symbols before you apply.
