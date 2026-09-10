terraform {
  required_version = ">= 1.12.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "first" {
  filename = "${path.module}/first.txt"
  content  = "first\n"
}

resource "local_file" "second" {
  filename = "${path.module}/second.txt"
  content  = local_file.first.content
}

resource "local_file" "sidecar" {
  filename   = "${path.module}/sidecar.txt"
  content    = "sidecar\n"
  depends_on = [local_file.first]
}

resource "local_file" "swap" {
  filename = "${path.module}/swap.txt"
  content  = "swap-v1\n"

  lifecycle {
    create_before_destroy = true
  }
}
