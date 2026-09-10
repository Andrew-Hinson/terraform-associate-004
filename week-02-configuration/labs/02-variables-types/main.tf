terraform {
  required_version = ">= 1.12.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "env" {
  type = string
  validation {
    condition     = contains(["dev", "stage", "prod"], var.env)
    error_message = "env must be dev, stage, or prod."
  }
}

variable "labels" {
  type = map(string)
}

variable "owners" {
  type    = list(string)
  default = ["platform"]
}

resource "local_file" "meta" {
  filename = "${path.module}/meta.txt"
  content = join("\n", concat(
    ["env=${var.env}"],
    [for k, v in var.labels : "${k}=${v}"],
    [for o in var.owners : "owner=${o}"],
  ))
}

output "label_keys" {
  value = sort(keys(var.labels))
}
