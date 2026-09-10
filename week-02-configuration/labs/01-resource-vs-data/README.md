# Lab 01 — Resource vs data

**Objectives:** 4a, 4b  
**Time:** 20 min

```bash
cd week-02-configuration/labs/01-resource-vs-data
echo "already on disk" > already-there.txt
terraform init
terraform apply
cat from-data.txt
```

`data.local_file.existing` reads a file Terraform did not create.  
`local_file.from_data` is managed and copies that content.

Delete `already-there.txt` and run `terraform plan`. The data source fails. That is expected.

**Exam takeaway:** data sources read. If the object is gone, the plan fails. Resources are the things Terraform owns.
