# Week 1 — IaC, providers, workflow

**Domains:** 1, 2, 3  
**Time:** 8–10 hours  
**Goal:** command behavior, not syntax trivia.

## Schedule

| Block | Hours | Do |
| --- | --- | --- |
| 1 | 2 | Read [notes.md](notes.md). Official tutorials: [OFFICIAL.md](../OFFICIAL.md) week 1 (objectives 1–3). |
| 2 | 2.5 | Labs 01 and 02 |
| 3 | 2.5 | Labs 03 and 04 |
| 4 | 2 | [quiz.md](quiz.md) closed-book. Restudy misses. Flashcards in `../FLASHCARDS.md` (week 1). |

## Labs

| Lab | Objective | Folder |
| --- | --- | --- |
| 01 Core workflow | 3a–3g | [labs/01-core-workflow](labs/01-core-workflow/) |
| 02 Multiple providers | 2b, 2c | [labs/02-multi-provider](labs/02-multi-provider/) |
| 03 Provider lock file | 2a | [labs/03-provider-lock](labs/03-provider-lock/) |
| 04 Plan actions | 2d, 3d, 3e | [labs/04-plan-actions](labs/04-plan-actions/) |

## Know cold before week 2

- `init` downloads providers and modules. `plan` does not.
- `validate` checks config. It is not a plan.
- `fmt` is style only.
- State maps real objects to addresses. Delete state ≠ destroy infra.
- Providers are plugins. Multi-cloud means many providers in one config.
