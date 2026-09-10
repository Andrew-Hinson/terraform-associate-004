# Lab 02 — Local backend path (stands in for remote)

**Objectives:** 6a, 6c  
**Time:** 25 min

You will not need S3. The mechanic is the same: backend config decides **where state lives**. Changing it requires `init -migrate-state`.

```bash
cd week-03-modules-state/labs/02-backend
terraform init
terraform apply
ls -la
```

State is `custom.tfstate`, not `terraform.tfstate`.

Change `path = "custom.tfstate"` to `path = "migrated.tfstate"`.

```bash
terraform init -migrate-state
ls -la
```

Terraform should offer to copy state to the new path.

## Remote backend + lock (6b, 6c)

Read [remote-s3.example.tf](remote-s3.example.tf). Same migrate mechanic as the path change above.

If you have an S3 bucket + DynamoDB lock table (or azurerm / gcs / `cloud`):

1. Start from local (this lab). Apply once.
2. Replace the `backend "local"` block with the remote block.
3. `terraform init -migrate-state` — state leaves the laptop.
4. `terraform apply` again. No changes.
5. From a **second** checkout of the same config, run `terraform apply` while the first apply is still running. The second process waits or errors on the lock.
6. If a run dies mid-lock: `terraform force-unlock LOCK_ID` only after you prove nothing is writing.

No bucket? Still know this cold:

- Local lock is a file-system lock. Not team-safe.
- S3 uses DynamoDB (or native S3 lock, depending on setup). Azure uses blob lease. GCS uses a lock object. HCP locks for you.
- Locking stops concurrent **state writes**, not concurrent reads.

**Exam takeaway:** local = file on disk. Remote = shared store + lock. Backend changes go through `init -migrate-state`. A second apply during a lock waits or fails.
