# Mock 2 — 30 questions, 60 minutes

Different wording. Same blueprint. Answers at the bottom.

1. A benefit of IaC is:
   - A. Cloud vendors stop charging
   - B. Environments can be reviewed and reproduced from files
   - C. You never need credentials

2. Hybrid cloud with Terraform usually means:
   - A. One provider talks to every datacenter automatically
   - B. Providers for on-prem and public cloud in the same workflow
   - C. Only HCP can see private networks

3. `terraform plan` by default:
   - A. Downloads providers
   - B. Refreshes state and shows the proposed diff
   - C. Deletes `terraform.lock.hcl`

4. `terraform fmt` :
   - A. Checks credentials
   - B. Rewrites HCL style
   - C. Locks state

5. Why does Terraform keep state?
   - A. To compile providers
   - B. To map addresses to real IDs and cache attributes
   - C. To store HCP team names

6. `terraform init -upgrade` :
   - A. Upgrades the OS package manager
   - B. Re-selects providers/modules within constraints and updates the lock file
   - C. Applies upgrades to VMs

7. Resource `aws_instance.web` referring to `data.aws_ami.ubuntu.id` creates:
   - A. An explicit `depends_on` only
   - B. An implicit dependency
   - C. A new backend

8. Which type is unordered and unique?
   - A. `list(string)`
   - B. `set(string)`
   - C. `tuple([string, string])`

9. `count` and `for_each` on the same resource:
   - A. Are required together
   - B. Are not allowed
   - C. Apply only in HCP

10. You have a hidden dependency with no attribute link. Use:
    - A. `lifecycle { ignore_changes = all }`
    - B. `depends_on`
    - C. `terraform fmt`

11. `prevent_destroy = true` causes apply to:
    - A. Skip the resource forever
    - B. Error if the plan would destroy it
    - C. Import the resource

12. `precondition` vs `postcondition`:
    - A. Both run only after destroy
    - B. Pre runs before the action; post can use `self` after
    - C. They replace `validate`

13. A secret in a `sensitive` output is:
    - A. Guaranteed absent from state
    - B. Still often stored in state, redacted in UI
    - C. Converted to an ephemeral resource automatically

14. The 004-era way to avoid persisting a generated password is:
    - A. `fmt`
    - B. An `ephemeral` resource (and/or write-only args)
    - C. `count = 0`

15. Vault appears on the exam as:
    - A. A required backend
    - B. A secrets manager you read instead of hardcoding
    - C. A replacement for providers

16. Registry module source format is:
    - A. `namespace/name/provider`
    - B. `provider://namespace`
    - C. Only a git SHA

17. Outputs from a child are consumed in the root as:
    - A. `var.child.out`
    - B. `module.NAME.OUTPUT`
    - C. `data.module.NAME`

18. Local backend locking is:
    - A. Equivalent to DynamoDB / Azure blob leases for teams
    - B. Limited; not the team-safe option
    - C. Mandatory for `validate`

19. `backend` configuration belongs in:
    - A. A `resource` block
    - B. The `terraform { }` block
    - C. An `output` block

20. Someone created a bucket in the console. Terraform has no address. You:
    - A. Refresh only
    - B. Write config and `import`
    - C. `state rm`

21. `terraform state show ADDR` :
    - A. Destroys ADDR
    - B. Prints attributes stored for ADDR
    - C. Formats ADDR

22. `terraform state mv` is used to:
    - A. Change provider versions
    - B. Rename/move addresses without destroying
    - C. Enable TRACE logs

23. Logs may contain secrets. Prefer:
    - A. `TF_LOG=TRACE` in every pipeline
    - B. `TF_LOG_PATH` and turning logs off after the debug session
    - C. Pasting TRACE into Slack

24. CLI-driven HCP workflow uses:
    - A. Only the AWS console
    - B. `terraform login` and a `cloud` block, then normal plan/apply
    - C. `backend "local"` plus Sentinel

25. Variable sets attach to:
    - A. Provider plugins
    - B. Many workspaces or a project
    - C. `terraform.lock.hcl`

26. Private registry on HCP publishes:
    - A. State files
    - B. Modules/providers for the org
    - C. `TF_LOG` output

27. Drift detection on HCP:
    - A. Replaces `required_providers`
    - B. Periodically compares reality to state/config
    - C. Formats modules

28. Two environments, two states, one repo. On HCP you typically:
    - A. Use two HCP workspaces
    - B. Delete state between applies
    - C. Set `count = 2` on the backend

29. `backend "remote"` on a 1.12 associate exam is:
    - A. The recommended current block
    - B. Legacy; prefer `cloud`
    - C. Required alongside `cloud`

30. Multi-answer: which are true of `terraform destroy`? (pick two)
    - A. It plans a destroy then applies it
    - B. It only removes the lock file
    - C. It targets Terraform-managed objects in state
    - D. It is an alias of `fmt`

## Answers (objective)

1. B (1b)  
2. B (1c)  
3. B (3d)  
4. B (3g)  
5. B (2d)  
6. B (2a, 3b)  
7. B (4b, 4f)  
8. B (4d)  
9. B (4e)  
10. B (4f)  
11. B (4f)  
12. B (4g)  
13. B (4h)  
14. B (4h)  
15. B (4h)  
16. A (5a)  
17. B (5c)  
18. B (6a, 6b)  
19. B (6c)  
20. B (6d, 7a)  
21. B (7b)  
22. B (7b)  
23. B (7c)  
24. B (8a, 8d)  
25. B (8b, 8c)  
26. B (8b)  
27. B (8b, 6d)  
28. A (8c)  
29. B (8d)  
30. A and C (3f)  
