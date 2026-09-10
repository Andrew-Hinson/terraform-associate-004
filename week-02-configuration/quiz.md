# Week 2 quiz — 15 questions

Closed book. Answers at the bottom.

1. A `data` block:
   - A. Creates and destroys the object
   - B. Reads an object Terraform does not manage
   - C. Is stored only in HCP

2. `local_file.web.id` is:
   - A. A data source address
   - B. A resource attribute reference
   - C. A variable

3. Root module variables are visible inside a child module:
   - A. Always
   - B. Only if passed as module inputs
   - C. Only if marked sensitive

4. `for_each` accepts:
   - A. A list with duplicate strings
   - B. A map or a set of strings
   - C. Any number

5. Changing the first element of a `count` list often:
   - A. Updates every instance in place
   - B. Replaces instances by index
   - C. Is impossible

6. `depends_on` is best used:
   - A. On every resource
   - B. When the dependency is not visible via attributes
   - C. Instead of `lifecycle`

7. `create_before_destroy` :
   - A. Prevents all destroys
   - B. Creates the replacement before destroying the old object
   - C. Ignores attribute drift

8. `ignore_changes = [tags]` means:
   - A. Tags can never be set
   - B. Drift on tags will not trigger an update
   - C. Tags are removed from state

9. A failed `precondition`:
   - A. Warns and continues
   - B. Fails the run
   - C. Writes a new state file

10. `postcondition` can use:
    - A. `self`
    - B. Only `var`
    - C. Only `ephemeral`

11. `sensitive = true` on an output:
    - A. Removes the value from state
    - B. Redacts it in CLI/UI
    - C. Encrypts the provider plugin

12. Ephemeral resources are stored in:
    - A. `terraform.tfstate`
    - B. The saved plan file
    - C. Neither state nor plan

13. Write-only arguments:
    - A. Are persisted like normal attributes
    - B. Are sent to the provider, then discarded
    - C. Replace `terraform output`

14. Vault on this exam is mainly about:
    - A. Replacing Terraform state
    - B. Fetching secrets instead of hardcoding them
    - C. Formatting HCL

15. `toset(["a", "a", "b"])` used with `for_each` creates how many instances?
    - A. 3
    - B. 2
    - C. 1

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
10. A  
11. B  
12. C  
13. B  
14. B  
15. B  
