# Example only. Do not apply unless you own the bucket and lock table.
# Swap this in for the local backend, then:
#   terraform init -migrate-state
# A second apply from another clone hits the lock (6b).

terraform {
  required_version = ">= 1.12.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
  backend "s3" {
    bucket         = "your-tfstate-bucket"
    key            = "004/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }
}

resource "local_file" "ok" {
  filename = "${path.module}/ok.txt"
  content  = "remote backend lab\n"
}
