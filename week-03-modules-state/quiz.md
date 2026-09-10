# Week 3 quiz — 12 questions

Closed book. Answers at the bottom.

1. A child module can read a root variable:
   - A. Automatically
   - B. Only when the root passes it as an input
   - C. Only after `state pull`

2. `version` on a `module` block is used for:
   - A. Local `./modules/x` paths
   - B. Registry (and many remote) sources
   - C. Provider plugins only

3. `module.vpc.public_subnets` is:
   - A. A root variable
   - B. An output from the `vpc` module
   - C. A data source

4. The local backend stores state:
   - A. In HCP only
   - B. In a file on disk (default `terraform.tfstate`)
   - C. In the lock file

5. State locking is meant to:
   - A. Encrypt secrets
   - B. Stop concurrent state writes
   - C. Format HCL

6. After changing a `backend` block you run:
   - A. `terraform apply -refresh-only`
   - B. `terraform init -migrate-state`
   - C. `terraform fmt`

7. Drift means:
   - A. The lock file is stale
   - B. Reality differs from the last refreshed state
   - C. A module version changed

8. `terraform apply -refresh-only`:
   - A. Changes real objects to match config
   - B. Updates state to match reality, does not change objects
   - C. Deletes state

9. `terraform import` requires:
   - A. No configuration
   - B. Config for the address plus a real ID
   - C. An HCP policy set

10. `terraform state rm` :
    - A. Destroys the real object
    - B. Untracks the object; the object remains
    - C. Unlocks the backend

11. `TF_LOG=TRACE` should be used:
    - A. On every apply in CI
    - B. When debugging, knowing logs may contain secrets
    - C. Instead of `validate`

12. `terraform state mv` is closest to:
    - A. `fmt`
    - B. A `moved` block / address refactor
    - C. `destroy`

## Answers

1. B  
2. B  
3. B  
4. B  
5. B  
6. B  
7. B  
8. B  
9. B  
10. B  
11. B  
12. B  
