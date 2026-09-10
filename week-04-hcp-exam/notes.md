# Week 4 notes — domain 8 + exam traps

## HCP Terraform vs Terraform CLI

**HCP Terraform** (was Terraform Cloud) is HashiCorp's hosted service. It stores state, runs Terraform remotely, holds variables, connects VCS, and adds teams/policy.

The CLI still exists. HCP is optional OSS + collaboration layer.

**Trap:** `terraform workspace` (CLI, local state namespaces) is **not** an HCP workspace. An HCP workspace is a remote object: one state, one variable set, one run history.

## 8a Create infrastructure on HCP

Three run workflows:

| Workflow | How a run starts | Where Terraform executes |
| --- | --- | --- |
| CLI-driven | `terraform plan` / `apply` on your machine | Remote HCP workers (typical) |
| VCS-driven | git push / PR | Remote HCP workers |
| API-driven | CI or script calls the API | Remote HCP workers |

Remote operations: your laptop uploads config. HCP runs `plan`/`apply`. State never needs to sit on your disk.

Free org is enough to see: create workspace → add a `local`/`random` config → run a plan.

## 8b Collaboration and governance

Know the **what**, not Sentinel syntax.

- **Teams / orgs:** users, teams, org-level and workspace-level permissions (read, plan, write, admin)
- **VCS connection:** GitHub, GitLab, Azure DevOps, etc. Speculative plans on PRs
- **Variable sets:** reusable vars/env vars attached to many workspaces or a project
- **Private registry:** publish modules/providers inside the org
- **Policy as code:** Sentinel and OPA. Fail a run if a rule fails (e.g. no public S3)
- **Health / drift detection:** HCP can periodically refresh and flag drift
- **Dynamic credentials:** OIDC-style short-lived cloud creds. Prefer over static `AWS_SECRET_ACCESS_KEY` in the workspace
- **Change requests / run tasks** (awareness): extra gates in the run pipeline

## 8c Projects and workspaces

```
Organization
  └── Project (permissions, variable sets)
        └── Workspace (state, vars, VCS, runs)
```

- **Project:** grouping + access boundary. New in the 004 delta list.
- **Workspace:** one independent state. `dev` / `prod` are usually two workspaces, not two `terraform workspace` CLI names on one state file
- Run triggers: one workspace apply can start another
- Same git repo can map to many workspaces via working directory / branch / tags

## 8d Integration (`cloud` block)

Current integration is the `cloud` block, **not** `backend "remote"` (legacy).

```hcl
terraform {
  cloud {
    organization = "your-org"
    workspaces {
      name    = "associate-004"
      project = "study"
    }
  }
}
```

```bash
terraform login
terraform init
terraform plan
```

`terraform login` stores an API token in the CLI credentials file.

`workspaces { tags = ["app", "dev"] }` selects by tag when one config maps to several workspaces.

You do **not** also declare a `backend "s3"` in the same root. HCP holds state.

## Exam traps (all domains)

- `validate` ≠ `plan`
- `fmt` ≠ validate
- delete state ≠ destroy
- `state rm` ≠ destroy
- `sensitive` ≠ omitted from state
- ephemeral / write-only ≠ `sensitive`
- CLI workspace ≠ HCP workspace
- `backend "remote"` ≠ current `cloud` block
- `count` index churn vs `for_each` keys
- implicit ref vs `depends_on`
- data source does not manage the object
- module inputs are the only way root vars enter a child
- `init -upgrade` vs `init` (lock file)
- `-refresh-only` updates state, not objects
- import needs config + ID
- `create_before_destroy` changes replace **order**
- conditions fail the run
