terraform {
  required_version = ">= 1.12.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "body" {
  type = string
  validation {
    condition     = var.body != "forbidden"
    error_message = "body cannot be forbidden."
  }
}

resource "local_file" "ok" {
  filename = "${path.module}/ok.txt"
  content  = var.body

  lifecycle {
    precondition {
      condition     = length(var.body) > 0
      error_message = "body must not be empty."
    }
    postcondition {
      condition     = length(self.content) > 0
      error_message = "wrote an empty file."
    }
  }
}

output "body" {
  value = var.body
  precondition {
    condition     = var.body != "nope"
    error_message = "output rejected body."
  }
}
