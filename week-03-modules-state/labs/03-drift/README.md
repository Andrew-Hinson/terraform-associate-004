# Lab 03 — Drift

**Objectives:** 6d  
**Time:** 20 min

```bash
cd week-03-modules-state/labs/03-drift
terraform init
terraform apply
echo "edited by hand" > tracked.txt
terraform plan
```

Plan should want to change the file back to `managed by terraform`.

```bash
terraform apply -refresh-only
terraform plan
```

`-refresh-only` updates state to the on-disk content and does not write the file. After that, a normal plan still wants to revert the file to the config value.

Apply if you want config to win. Or change the `.tf` content to match reality.

**Exam takeaway:** refresh reads reality into state. Apply makes reality match config. Import is for objects that are not in state at all.
