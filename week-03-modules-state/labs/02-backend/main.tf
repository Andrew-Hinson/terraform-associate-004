terraform {
  required_version = ">= 1.12.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
  backend "local" {
    path = "custom.tfstate"
  }
}

resource "local_file" "ok" {
  filename = "${path.module}/ok.txt"
  content  = "backend lab\n"
}
