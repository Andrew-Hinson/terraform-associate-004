# Terraform Associate 004 — 4 week course

HashiCorp Certified: Terraform Associate (004). Terraform **1.12**.  
Audience: you already run `init` / `plan` / `apply` and write basic HCL.

**Pace:** 8–10 hours/week. ~35–40 hours total.  
**Labs:** `hashicorp/random` + `hashicorp/local`. No cloud account until week 4 (HCP, optional).

This repo is the course. Rock-paper-scissors is gone.

Install Terraform 1.12.x before day 1:

```bash
terraform version
```

## Exam facts

| Item | Official value |
| --- | --- |
| Duration | 1 hour |
| Format | Online proctored, selected response (MC, multi-answer, T/F) |
| Price | $70.50 USD + tax. No free retake |
| Language | English |
| Badge | 2 years |
| Question count / pass score | Not published by HashiCorp |

Register: [Infrastructure Automation certifications](https://developer.hashicorp.com/certifications/infrastructure-automation)

Official study only:

1. [Learning path 004](https://developer.hashicorp.com/terraform/tutorials/certification-004/associate-study-004)
2. [Exam content list 004](https://developer.hashicorp.com/terraform/tutorials/certification-004/associate-review-004)
3. [Sample questions 004](https://developer.hashicorp.com/terraform/tutorials/certification-004/associate-questions-004)

Per-week official tutorial list: [OFFICIAL.md](OFFICIAL.md).

## 004 deltas vs 003

Do not skip these. HashiCorp called them out:

- **4f** `depends_on` and `create_before_destroy`
- **4g** custom conditions (`validation`, `precondition`, `postcondition`)
- **4h** sensitive data, **ephemeral values**, **write-only arguments**
- **8c** HCP projects and workspaces
- Full **HCP Terraform** domain. Product version **1.12**

## Weeks

| Week | Hours | Domains | Folder |
| --- | --- | --- | --- |
| 1 | 8–10 | 1 IaC, 2 fundamentals, 3 workflow | [week-01-workflow](week-01-workflow/) |
| 2 | 10–12 | 4 configuration (heaviest) | [week-02-configuration](week-02-configuration/) |
| 3 | 8–10 | 5 modules, 6 state, 7 maintain | [week-03-modules-state](week-03-modules-state/) |
| 4 | 8–10 | 8 HCP + mocks | [week-04-hcp-exam](week-04-hcp-exam/) |

Track every objective in [CHECKLIST.md](CHECKLIST.md).  
All flashcards: [FLASHCARDS.md](FLASHCARDS.md).

## How to use this course

1. Read that week's `notes.md`.
2. Run every lab. Type the commands. Do not only read the `.tf`.
3. Take the quiz closed-book. Score by objective.
4. Misses go back to the content list, not a random video.
5. Week 4: official samples, then three timed mocks. Book when mocks feel boring.

## What not to study

- AWS/Azure/GCP APIs
- Authoring and Operations Advanced (lab exam)
- 0.12 syntax
- Treating `terraform workspace` as the same thing as an HCP workspace
- Writing Sentinel policy
