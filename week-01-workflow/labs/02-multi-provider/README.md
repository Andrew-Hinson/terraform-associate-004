# Lab 02 — Multiple providers

**Objectives:** 2b, 2c  
**Time:** 25 min

Two providers in one root module. `random` is used twice: default + aliased.

```bash
cd week-01-workflow/labs/02-multi-provider
terraform init
terraform apply
cat names.txt
terraform destroy
```

Then answer:

1. Which resource used `random.extra`
2. What would happen if you removed `provider = random.extra` (it would use the default `random` provider)
3. Why this pattern matters for multi-region / multi-account configs (same provider type, different settings)

**Exam takeaway:** one config, many providers. Alias when you need two configurations of the same provider type.
