# Lab 01 — HCP cloud block (optional)

**Objectives:** 8a, 8c, 8d  
**Time:** 45–60 min if you create an account

1. Create a free HCP Terraform org: https://app.terraform.io
2. Create a project `study` and a workspace `associate-004` (CLI workflow)
3. Edit `main.tf` organization / project / workspace names
4. Run:

```bash
cd week-04-hcp-exam/labs/01-cloud-block
terraform login
terraform init
terraform plan
terraform apply
```

The run should appear in the HCP UI. State is remote.

Then click through (no need to configure all of them):

- Variable set attached to the project
- Team access on the project
- Policy (Sentinel/OPA) docs
- VCS settings on a workspace

**Exam takeaway:** `terraform login` + `cloud` block. Project groups workspaces. HCP stores state and can run remotely.

Skip this lab if you do not want an account. Domain 8 is still passable from [notes.md](../../notes.md) plus the official Get Started collection.
