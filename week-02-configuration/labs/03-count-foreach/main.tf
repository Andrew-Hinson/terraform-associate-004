terraform {
  required_version = ">= 1.12.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "counted" {
  type    = list(string)
  default = ["one", "two"]
}

variable "names" {
  type    = set(string)
  default = ["alpha", "beta"]
}

resource "local_file" "counted" {
  count    = length(var.counted)
  filename = "${path.module}/count-${count.index}.txt"
  content  = var.counted[count.index]
}

resource "local_file" "named" {
  for_each = var.names
  filename = "${path.module}/${each.key}.txt"
  content  = each.value
}
