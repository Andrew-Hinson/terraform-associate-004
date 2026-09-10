variable "name" {
  type = string
}

variable "prefix" {
  type    = string
  default = "app"
}

resource "local_file" "marker" {
  filename = "${path.module}/marker.txt"
  content  = "${var.prefix}-${var.name}\n"
}

output "id" {
  value = trimspace(local_file.marker.content)
}
