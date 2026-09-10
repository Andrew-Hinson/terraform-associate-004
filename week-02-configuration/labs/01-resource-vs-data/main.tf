terraform {
  required_version = ">= 1.12.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

data "local_file" "existing" {
  filename = "${path.module}/already-there.txt"
}

resource "local_file" "from_data" {
  filename = "${path.module}/from-data.txt"
  content  = data.local_file.existing.content
}

output "source_path" {
  value = data.local_file.existing.filename
}
