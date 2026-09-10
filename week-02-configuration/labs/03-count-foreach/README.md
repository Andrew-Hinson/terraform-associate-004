# Lab 03 — count vs for_each

**Objectives:** 4e  
**Time:** 30 min

```bash
cd week-02-configuration/labs/03-count-foreach
terraform init
terraform apply
terraform state list
```

Addresses should look like:

- `local_file.counted[0]`
- `local_file.named["alpha"]`

Edit `names` from `["alpha", "beta"]` to `["beta", "gamma"]`. Plan.

Expect:

- `count` list reorder can **replace index 0** even if the string only moved
- `for_each` destroys `alpha`, creates `gamma`, leaves `beta` alone

**Exam takeaway:** prefer `for_each` when instances have stable keys. `count` is index-based and brittle when lists change.
