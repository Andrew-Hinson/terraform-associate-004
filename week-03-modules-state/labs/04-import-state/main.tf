terraform {
  required_version = ">= 1.12.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

# Import ID is random_id.id (base64). local_file cannot be imported.
resource "random_id" "existing" {
  byte_length = 4
}

output "import_id" {
  value = random_id.existing.id
}
