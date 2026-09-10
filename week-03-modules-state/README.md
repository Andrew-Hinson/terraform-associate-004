# Week 3 — Modules, state, maintain

**Domains:** 5, 6, 7  
**Time:** 8–10 hours

## Schedule

| Block | Hours | Do |
| --- | --- | --- |
| 1 | 2.5 | Official tutorials: [OFFICIAL.md](../OFFICIAL.md) week 3. Notes: modules. Lab 01 |
| 2 | 3 | Notes: backends, locking, drift. Labs 02–03 |
| 3 | 2.5 | Notes: import, state CLI, logging. Labs 04–05 |
| 4 | 2 | [quiz.md](quiz.md) + flashcards |

## Labs

| Lab | Objective | Folder |
| --- | --- | --- |
| 01 Local module | 5a–5d | [labs/01-module](labs/01-module/) |
| 02 Backend path | 6a, 6c | [labs/02-backend](labs/02-backend/) |
| 03 Drift | 6d | [labs/03-drift](labs/03-drift/) |
| 04 Import and state CLI | 7a, 7b | [labs/04-import-state](labs/04-import-state/) |
| 05 Verbose logging | 7c | [labs/05-logging](labs/05-logging/) |

## Know cold before week 4

- Child module vars are isolated. Root `var.x` is not `module.child`'s `var.x` unless passed.
- Module sources: local path, registry (`namespace/name/provider`), git, s3, etc.
- Registry modules take a `version` argument.
- Local backend = `terraform.tfstate` in the dir. Locking is weak / not for teams.
- Remote backend + locking stops concurrent writes.
- `state rm` untracks. It does not destroy.
- Import needs config that matches the object.
- `TF_LOG` / `TF_LOG_PATH` are for plugin/API failures, not everyday apply.
