# Lab 01 — Local module

**Objectives:** 5a–5d  
**Time:** 30 min

```bash
cd week-03-modules-state/labs/01-module
terraform init
terraform apply
cat out.txt
terraform state list
```

You should see `module.label.local_file.marker` and a root `local_file.out`.

Change the child module's `prefix` default. Plan. Nothing changes until you pass a new `prefix` from the root. Root `var.project` is not visible inside the child unless passed.

Read `modules/label/README.md` for the registry `version` note. You cannot set `version` on a `./` source.

**Exam takeaway:** source + inputs + outputs. Scope is isolated. Pin `version` on registry modules.
