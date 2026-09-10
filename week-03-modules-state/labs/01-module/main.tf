terraform {
  required_version = ">= 1.12.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "project" {
  type    = string
  default = "004"
}

module "label" {
  source  = "./modules/label"
  name    = var.project
  prefix  = "tf"
}

resource "local_file" "out" {
  filename = "${path.module}/out.txt"
  content  = module.label.id
}

output "label_id" {
  value = module.label.id
}
