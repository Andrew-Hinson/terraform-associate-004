# Lab 04 — depends_on and create_before_destroy

**Objectives:** 4f  
**Time:** 25 min

```bash
cd week-02-configuration/labs/04-lifecycle
terraform init
terraform apply
```

`local_file.second` references `local_file.first.content`. That is an implicit dependency. `depends_on` on `local_file.sidecar` is the explicit form, used when there is no attribute link.

Change `filename` on `local_file.swap` (ForceNew). Plan.

Because `create_before_destroy = true`, Terraform creates the new file before destroying the old one. Without that flag, replace is destroy-then-create.

**Exam takeaway:** implicit refs first. `depends_on` for hidden coupling. `create_before_destroy` changes replace order. Know `prevent_destroy` and `ignore_changes` by name.
