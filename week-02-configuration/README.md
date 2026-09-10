# Week 2 — Configuration (domain 4)

**Time:** 10–12 hours  
**Goal:** this is where people who "already apply stuff" fail 004.

## Schedule

| Block | Hours | Do |
| --- | --- | --- |
| 1 | 3 | Official tutorials: [OFFICIAL.md](../OFFICIAL.md) week 2. Notes: resource/data, refs, vars, types. Labs 01–02 |
| 2 | 3 | Notes: expressions, `count` / `for_each`. Lab 03 |
| 3 | 3 | Notes: `depends_on`, lifecycle, conditions. Labs 04–05 |
| 4 | 2–3 | Notes: sensitive / Vault / ephemeral / write-only. Lab 06. [quiz.md](quiz.md) |

## Labs

| Lab | Objective | Folder |
| --- | --- | --- |
| 01 Resource vs data | 4a, 4b | [labs/01-resource-vs-data](labs/01-resource-vs-data/) |
| 02 Variables and types | 4c, 4d | [labs/02-variables-types](labs/02-variables-types/) |
| 03 count vs for_each | 4e | [labs/03-count-foreach](labs/03-count-foreach/) |
| 04 Dependencies and lifecycle | 4f | [labs/04-lifecycle](labs/04-lifecycle/) |
| 05 Custom conditions | 4g | [labs/05-conditions](labs/05-conditions/) |
| 06 Sensitive and ephemeral | 4h | [labs/06-sensitive-ephemeral](labs/06-sensitive-ephemeral/) |

## Know cold before week 3

- Data sources read. Resources manage.
- `count` index vs `for_each` key. Changing a `for_each` key replaces that instance.
- `depends_on` is for hidden dependencies. Prefer implicit refs.
- Conditions fail the run. They are not `ignore_changes`.
- `sensitive` redacts UI output. The value can still live in state.
- Ephemeral values and write-only arguments are **not** stored in state or plan.
