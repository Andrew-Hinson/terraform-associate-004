# Lab 05 — Verbose logging

**Objectives:** 7c  
**Time:** 15 min

```bash
cd week-03-modules-state/labs/05-logging
terraform init
TF_LOG=DEBUG TF_LOG_PATH=./terraform.log terraform apply
less terraform.log
```

You should see provider plugin attach, file writes, and state updates.

Repeat with `TF_LOG=ERROR`. The file is much smaller.

Unset when done:

```bash
unset TF_LOG TF_LOG_PATH
```

**Exam takeaway:** enable logging to debug provider/API/`init` failures. `TRACE` is huge and can leak secrets. Prefer `TF_LOG_PATH` so the terminal stays clean. `TF_LOG_CORE` vs `TF_LOG_PROVIDER` split the streams.
