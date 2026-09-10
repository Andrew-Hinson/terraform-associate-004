# Lab 03 — Collaboration, policy, drift, VCS

**Objectives:** 8a, 8b  
**Time:** 30 min. Skim. Do not write Sentinel.

Open the official tutorials from [OFFICIAL.md](../../../OFFICIAL.md) week 4, then click the matching HCP screens if you have an org.

## VCS-driven run (8a)

1. Workspace settings → Version Control. See GitHub / GitLab / Azure DevOps connect.
2. Know: push to the tracked branch starts a run on HCP workers. A PR usually gets a **speculative plan** (plan, no apply).
3. Contrast CLI-driven (`terraform login` + `cloud` block) and API-driven (CI posts a run).

You do not need to connect a real repo.

## Policy as code (8b)

1. Org → Policy / Policy sets. Note Sentinel and OPA.
2. Read [Enforce OPA Policies](https://developer.hashicorp.com/terraform/tutorials/cloud/opa) enough to answer: a failed policy **blocks apply**. It does not replace `validate`.
3. You will not write a production policy on this exam.

## Drift / health (8b, 6d)

1. Workspace → Health / drift detection docs.
2. HCP can refresh on a schedule and flag objects that changed outside Terraform.
3. Same idea as week 3 lab 03, hosted.

## Other 8b names

- **Teams:** org/project/workspace permissions (read, plan, write, admin)
- **Private registry:** publish modules for the org
- **Dynamic credentials:** short-lived OIDC-style cloud creds for the run. Prefer over static keys in workspace vars
- **Run tasks / change requests:** extra gates. Awareness only

**Exam takeaway:** name the feature and when you would use it. VCS starts remote runs. Policy gates the run. Drift is scheduled refresh. Dynamic creds replace long-lived keys.
