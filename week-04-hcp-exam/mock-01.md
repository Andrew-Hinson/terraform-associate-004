# Mock 1 — 30 questions, 60 minutes

Closed book. Mark the clock. Answers and objectives at the bottom.

1. Which statement best describes IaC with Terraform?
   - A. A GUI that clicks cloud consoles for you
   - B. Desired infrastructure written as code and applied to reach that state
   - C. A hypervisor

2. Terraform reaches AWS and GitHub in one configuration because:
   - A. Terraform includes every cloud API in the core binary
   - B. Each API is implemented by a provider plugin
   - C. HCP translates resource types across vendors

3. `terraform init` does which of the following?
   - A. Applies the saved plan
   - B. Installs providers/modules and configures the backend
   - C. Formats every `.tf` file

4. `terraform validate` requires:
   - A. A successful apply
   - B. An initialized working directory
   - C. An HCP workspace

5. You delete `terraform.tfstate` but not the VMs. Next `apply` will:
   - A. Destroy the VMs
   - B. Likely try to create new objects (Terraform no longer has IDs)
   - C. Unlock the backend

6. The dependency lock file records:
   - A. Output values
   - B. Selected provider versions and hashes
   - C. Sentinel policies

7. Two `provider "aws"` blocks, one with `alias = "west"`. A resource in `us-west-2` must set:
   - A. `provider = aws.west`
   - B. `alias = west`
   - C. `backend = west`

8. A `data` source:
   - A. Always creates the object if missing
   - B. Reads an existing object
   - C. Replaces `terraform import`

9. `module.db.password` is valid only if:
   - A. The child module declared an output named `password`
   - B. The root variable is named `password`
   - C. State locking is enabled

10. `for_each = toset(["a", "a", "b"])` creates:
    - A. 3 instances
    - B. 2 instances
    - C. 1 instance

11. You need the new object to exist before the old one is destroyed. Set:
    - A. `prevent_destroy = true`
    - B. `create_before_destroy = true`
    - C. `ignore_changes = all`

12. A variable `validation` block fails when:
    - A. `terraform fmt` runs
    - B. The variable value does not satisfy `condition`
    - C. The provider plugin is missing

13. `sensitive = true` on an output:
    - A. Guarantees the value is absent from state
    - B. Redacts the value in CLI/UI
    - C. Enables write-only mode

14. Ephemeral resources are persisted in:
    - A. State and plan
    - B. State only
    - C. Neither state nor plan

15. Write-only arguments typically come with a:
    - A. `backend` block
    - B. `*_wo_version` that you bump to write a new secret
    - C. `terraform workspace` name

16. Local module source `./mod` should also set:
    - A. `version = "1.0.0"`
    - B. No `version` argument
    - C. `alias = "local"`

17. Child module `variable "env"` is set by:
    - A. Root `TF_VAR_env` automatically
    - B. The `module` block argument `env = ...`
    - C. `terraform fmt`

18. State locking exists to:
    - A. Compress state
    - B. Prevent concurrent writes to the same state
    - C. Hide outputs

19. You changed `backend "s3"` keys. Next command:
    - A. `terraform apply`
    - B. `terraform init -migrate-state`
    - C. `terraform output`

20. `-refresh-only` :
    - A. Updates state from reality without changing objects
    - B. Destroys drifted objects
    - C. Upgrades providers

21. Import requires:
    - A. Only the real ID
    - B. Configuration for the address and the real ID
    - C. A Sentinel policy

22. `terraform state rm aws_instance.web` :
    - A. Terminates the instance
    - B. Drops the instance from state
    - C. Moves it to another workspace

23. `TF_LOG=DEBUG` is appropriate when:
    - A. You want quieter CI logs
    - B. You are debugging a provider or API failure
    - C. You need to skip `init`

24. An HCP **project** is:
    - A. A local `.terraform` directory
    - B. A grouping of workspaces with shared access/variable sets
    - C. A Terraform binary version

25. An HCP workspace is the same as `terraform workspace` CLI:
    - A. Yes, always
    - B. No. HCP workspace is a remote object with its own state and runs
    - C. Only on the local backend

26. Preferred HCP integration in 1.12:
    - A. `backend "remote"`
    - B. `cloud` block + `terraform login`
    - C. `backend "local"`

27. VCS-driven HCP runs start when:
    - A. You run `terraform fmt`
    - B. A connected repo push or PR occurs
    - C. The lock file changes on your laptop

28. Policy as code on HCP (Sentinel/OPA) is used to:
    - A. Replace providers
    - B. Enforce rules on plans/applies
    - C. Generate `count` indices

29. Dynamic credentials on HCP are meant to:
    - A. Store long-lived cloud keys in git
    - B. Issue short-lived cloud creds (OIDC-style) for runs
    - C. Replace `required_providers`

30. Multi-answer: which commands change real infrastructure? (pick two)
    - A. `terraform apply`
    - B. `terraform destroy`
    - C. `terraform validate`
    - D. `terraform fmt`

## Answers (objective)

1. B (1a)  
2. B (1c, 2b)  
3. B (3b)  
4. B (3c)  
5. B (2d)  
6. B (2a)  
7. A (2c)  
8. B (4a)  
9. A (5b, 5c)  
10. B (4e)  
11. B (4f)  
12. B (4g)  
13. B (4h)  
14. C (4h)  
15. B (4h)  
16. B (5a, 5d)  
17. B (5b)  
18. B (6b)  
19. B (6c)  
20. A (6d)  
21. B (7a)  
22. B (7b)  
23. B (7c)  
24. B (8c)  
25. B (8c)  
26. B (8d)  
27. B (8a, 8b)  
28. B (8b)  
29. B (8b)  
30. A and B (3e, 3f)  
