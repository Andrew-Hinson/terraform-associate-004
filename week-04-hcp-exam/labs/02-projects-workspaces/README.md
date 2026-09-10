# Lab 02 — Projects, two workspaces, variable sets

**Objectives:** 8b, 8c  
**Time:** 30–40 min (click-through in a free HCP org, or read-only)

HCP layout:

```
Organization
  └── Project "study"
        ├── Workspace "associate-004-dev"
        └── Workspace "associate-004-prod"
        └── Variable set "shared-labels"  (attached at project)
```

## Do this in the UI

1. Org → **Projects** → create `study`.
2. In `study`, create workspace `associate-004-dev` (CLI workflow).
3. Create workspace `associate-004-prod` (CLI workflow).
4. **Variable sets** → create `shared-labels` with `env` leftover to the workspace and a project-level `owner=platform`.
5. Attach the set to project `study` (both workspaces inherit).
6. On `associate-004-prod` only, set workspace var `env=prod` (overrides the set if you configured it that way).
7. Open each workspace. Confirm: one state each, one run history each.

If you already ran [lab 01](../01-cloud-block/), point the `cloud` block at `associate-004-dev`, apply, then change `name` to `associate-004-prod` and apply again. Two states.

## Know cold

| Thing | What it is |
| --- | --- |
| Project | Access boundary + variable-set attachment |
| HCP workspace | One remote state + vars + runs |
| CLI `terraform workspace` | Local state namespace. **Not** the same object |
| Variable set | Reusable vars on many workspaces or a project |
| Workspace var | One workspace only. Can override a set |
| Run trigger | Apply in A can start a run in B |

**Exam takeaway:** two environments = two HCP workspaces (often one project). Variable sets are shared. CLI workspaces are a different feature.
