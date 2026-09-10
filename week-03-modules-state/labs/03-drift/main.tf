terraform {
  required_version = ">= 1.12.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "tracked" {
  filename = "${path.module}/tracked.txt"
  content  = "managed by terraform\n"
}
