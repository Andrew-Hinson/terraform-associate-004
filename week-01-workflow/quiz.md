# Week 1 quiz — 12 questions

Closed book. Answers at the bottom.

1. Terraform is primarily:
   - A. An imperative cloud CLI
   - B. A declarative IaC tool that uses providers to reach APIs
   - C. A replacement for cloud IAM

2. Multi-cloud in Terraform means:
   - A. One HashiCorp-hosted control plane is required
   - B. One configuration can use many providers in the same run
   - C. Terraform translates AWS resources into Azure automatically

3. Which command downloads providers?
   - A. `terraform plan`
   - B. `terraform validate`
   - C. `terraform init`

4. `terraform validate` will:
   - A. Refresh remote objects and print a diff
   - B. Check configuration consistency after `init`
   - C. Format files in place

5. Deleting `terraform.tfstate` will:
   - A. Destroy all managed infrastructure
   - B. Make Terraform forget objects it created
   - C. Lock the backend

6. `terraform.lock.hcl` pins:
   - A. Variable values
   - B. Provider plugin versions and hashes
   - C. HCP workspace names

7. To use two AWS regions in one config you typically:
   - A. Install two Terraform binaries
   - B. Declare two `provider` blocks and set `alias` on one
   - C. Use two state files in the same directory

8. `terraform init -upgrade` :
   - A. Upgrades the Terraform binary
   - B. Recalculates provider/module selections within version constraints
   - C. Applies pending changes

9. `terraform fmt` :
   - A. Changes resource behavior
   - B. Rewrites HCL style only
   - C. Validates provider credentials

10. Which command updates real infrastructure?
    - A. `plan`
    - B. `apply`
    - C. `validate`

11. State exists so Terraform can:
    - A. Compile HCL to binaries
    - B. Map addresses to real IDs and track metadata
    - C. Store provider plugins

12. A plan that must destroy and recreate an object is a:
    - A. No-op
    - B. In-place update
    - C. Replace

## Answers

1. B  
2. B  
3. C  
4. B  
5. B  
6. B  
7. B  
8. B  
9. B  
10. B  
11. B  
12. C  
