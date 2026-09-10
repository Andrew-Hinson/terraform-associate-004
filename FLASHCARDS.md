# Flashcards

Cover the answer. Say it out loud.

## Week 1

Q: Declarative vs imperative?  
A: Declarative = desired state. Imperative = steps.

Q: How is Terraform multi-cloud?  
A: Many providers in one config. Not one magic translator.

Q: What does `init` write?  
A: `.terraform/` and usually `terraform.lock.hcl`. Configures backend.

Q: `validate` vs `plan`?  
A: Validate = config only. Plan = refresh + diff.

Q: `fmt` changes behavior?  
A: No. Style only.

Q: Delete state?  
A: Terraform forgets IDs. Infra remains.

Q: Lock file vs `required_providers`?  
A: Constraint vs exact pin + hashes.

Q: When `init -upgrade`?  
A: To re-resolve versions within constraints.

Q: Provider alias?  
A: Second config of the same provider type. Set `provider = name.alias`.

## Week 2

Q: Resource vs data?  
A: Manage vs read.

Q: Implicit dependency?  
A: Attribute reference. Graph edge.

Q: How do child modules get root vars?  
A: You pass them. No inherit.

Q: `for_each` input type?  
A: Map or set of strings.

Q: Why `for_each` over `count`?  
A: Stable keys. List edits do not reshuffle indices.

Q: When `depends_on`?  
A: Hidden dependency. No attribute link.

Q: `create_before_destroy`?  
A: Create replacement first, then destroy old.

Q: Failed condition?  
A: Run fails. Not ignore_changes.

Q: `precondition` vs `postcondition`?  
A: Before action vs after (`self`).

Q: `sensitive` in state?  
A: Often yes. Redacted in UI only.

Q: Ephemeral stored?  
A: No. Not state, not plan.

Q: Write-only arg?  
A: Sent to provider, discarded. Bump `*_wo_version` to rotate.

Q: Vault role on 004?  
A: Fetch secrets. Do not hardcode.

## Week 3

Q: Local module `version`?  
A: Do not set. Registry/git yes.

Q: Registry source shape?  
A: `namespace/name/provider`.

Q: `module.x.y`?  
A: Output `y` of module `x`.

Q: Default local state path?  
A: `terraform.tfstate`.

Q: Why remote state + lock?  
A: Shared store. No concurrent writes.

Q: Backend change command?  
A: `terraform init -migrate-state`.

Q: `-refresh-only`?  
A: State ← reality. Objects unchanged.

Q: Import needs?  
A: Config address + real ID.

Q: `state rm`?  
A: Untrack. Object stays.

Q: `state mv` cousin?  
A: `moved` block.

Q: When `TF_LOG`?  
A: Debug provider/API/init. Can leak secrets.

## Week 4

Q: CLI workspace vs HCP workspace?  
A: Not the same. HCP = remote state + runs + vars.

Q: Project?  
A: Groups workspaces. Access + variable sets.

Q: Three run workflows?  
A: CLI, VCS, API.

Q: Current HCP block?  
A: `cloud {}` + `terraform login`. Not `backend "remote"`.

Q: Variable set?  
A: Reusable vars on many workspaces/project.

Q: Policy as code?  
A: Sentinel/OPA gates on the run.

Q: Dynamic credentials?  
A: Short-lived OIDC-style cloud creds.

Q: Where does HCP run Terraform?  
A: Remote workers. State stays on HCP.
