terraform {
  required_version = ">= 1.12.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "secret" {
  type      = string
  sensitive = true
  default   = "super-secret"
}

resource "random_password" "stored" {
  length = 16
}

ephemeral "random_password" "not_stored" {
  length = 16
}

resource "local_file" "marker" {
  filename = "${path.module}/applied.txt"
  content  = "ephemeral password was generated for this run only\n"
}

output "secret" {
  value     = var.secret
  sensitive = true
}

output "stored_password_is_in_state" {
  value     = random_password.stored.result
  sensitive = true
}

# Write-only pattern (cloud resources). Not applied here.
# resource "some_db" "example" {
#   password_wo         = ephemeral.random_password.not_stored.result
#   password_wo_version = 1
# }
