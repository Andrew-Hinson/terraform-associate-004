terraform {
  required_version = ">= 1.12.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "log_me" {
  filename = "${path.module}/log-me.txt"
  content  = "logging lab\n"
}
