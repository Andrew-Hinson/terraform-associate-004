# Mock 3 — 30 questions, 60 minutes

Last timed set. Closed book. Answers at the bottom.

1. T/F: Terraform is an imperative tool that lists API calls in order.
   - A. True
   - B. False

2. Service-agnostic Terraform workflows work because:
   - A. Core ships every vendor API
   - B. Providers encapsulate each API
   - C. HCP rewrites resource types

3. After `init`, which directory holds downloaded providers?
   - A. `.terraform/`
   - B. `terraform.tfvars`
   - C. `outputs.tf`

4. `terraform plan -out=save.tfplan` then `terraform apply save.tfplan`:
   - A. Recomputes a new plan and ignores the file
   - B. Applies that saved plan
   - C. Formats the file

5. `terraform destroy` removes:
   - A. Only the lock file
   - B. Objects Terraform manages in the current state
   - C. All cloud accounts

6. A provider `version = "~> 5.0"` allows:
   - A. Only 5.0.0 exact
   - B. 5.x, not 6.0
   - C. Any version

7. You need two Azure subscriptions in one root module. You:
   - A. Install two Terraform binaries
   - B. Use two `provider` blocks and an `alias`
   - C. Use `count` on the backend

8. T/F: A data source creates the object if it does not exist.
   - A. True
   - B. False

9. `var.list[0]` vs `each.key` — which pair is correct?
   - A. `count` uses index; `for_each` uses key
   - B. Both use index
   - C. Both use key

10. `lookup(var.map, "env", "dev")` returns:
    - A. Always error if `env` is missing
    - B. `var.map["env"]` or `"dev"` if absent
    - C. A data source

11. Implicit dependency is created by:
    - A. `terraform fmt`
    - B. Referencing another resource’s attribute
    - C. `TF_LOG`

12. `lifecycle { ignore_changes = [ami] }` means:
    - A. AMI can never be set
    - B. Later AMI drift will not update the resource
    - C. The resource is ephemeral

13. Custom conditions vs `validate`:
    - A. They are the same command
    - B. `validate` is a CLI syntax/config check; conditions are in HCL and fail the run
    - C. Conditions only run on `fmt`

14. T/F: `sensitive = true` removes the value from state.
    - A. True
    - B. False

15. Write-only + ephemeral together are used to:
    - A. Format modules
    - B. Pass a secret into a resource without storing it in state/plan
    - C. Replace `required_providers`

16. A registry module call should include:
    - A. `alias` only
    - B. `source` and usually `version`
    - C. `backend`

17. Root `variable "region"` inside `module "net"` is:
    - A. Automatically `var.region` in the child
    - B. Available only if the module block sets `region = var.region`
    - C. Written to the lock file

18. T/F: The local backend is the default and stores state as a local file.
    - A. True
    - B. False

19. Two engineers `apply` the same remote state at once. Locking should:
    - A. Merge both writes
    - B. Let one write; the other waits or errors
    - C. Delete the state

20. `terraform apply -refresh-only` after someone edited a tag in the console:
    - A. Puts the tag back
    - B. Updates state to the console value; does not change the object
    - C. Imports a new address

21. Import without matching config:
    - A. Always succeeds
    - B. Fails or is incomplete; you need an address in config
    - C. Destroys the object

22. `terraform state list` shows:
    - A. Provider versions
    - B. Resource addresses in state
    - C. HCP teams

23. `TF_LOG=ERROR` vs `TRACE`:
    - A. ERROR is noisier
    - B. TRACE is noisier and more likely to leak secrets
    - C. They are aliases

24. HCP remote operations mean:
    - A. `plan`/`apply` run on HCP workers; state stays remote
    - B. You must use `backend "local"`
    - C. Providers are banned

25. A project-level variable set applies to:
    - A. One resource
    - B. Workspaces in that project (unless you scope it tighter)
    - C. The lock file

26. T/F: `terraform workspace select prod` is the same as opening an HCP workspace named prod.
    - A. True
    - B. False

27. Current CLI integration with HCP:
    - A. `cloud` block and `terraform login`
    - B. `backend "remote"` only
    - C. `TF_LOG=TRACE`

28. A VCS speculative plan typically:
    - A. Applies to production
    - B. Plans a PR without applying
    - C. Deletes state

29. Dynamic credentials exist to:
    - A. Check in long-lived keys
    - B. Give the run short-lived cloud creds
    - C. Replace `fmt`

30. Multi-answer: pick the two 004-new / 004-called-out topics.
    - A. Custom conditions
    - B. `terraform graph` as a scored lab
    - C. HCP projects
    - D. 0.11 interpolation only

## Answers (objective)

1. B (1a)  
2. B (1c, 2b)  
3. A (3b)  
4. B (3d, 3e)  
5. B (3f)  
6. B (2a)  
7. B (2c)  
8. B (4a)  
9. A (4e)  
10. B (4e)  
11. B (4b, 4f)  
12. B (4f)  
13. B (3c, 4g)  
14. B (4h)  
15. B (4h)  
16. B (5a, 5d)  
17. B (5b)  
18. A (6a)  
19. B (6b)  
20. B (6d)  
21. B (7a)  
22. B (7b)  
23. B (7c)  
24. A (8a)  
25. B (8c)  
26. B (8c)  
27. A (8d)  
28. B (8a, 8b)  
29. B (8b)  
30. A and C (4g, 8c)  
