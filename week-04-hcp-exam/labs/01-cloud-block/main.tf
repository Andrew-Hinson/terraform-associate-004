terraform {
  required_version = ">= 1.12.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

  # Fill in after you create a free HCP org. Do not commit tokens.
  # cloud {
  #   organization = "YOUR_ORG"
  #   workspaces {
  #     name    = "associate-004"
  #     project = "study"
  #   }
  # }
}

resource "random_pet" "hcp" {
  length = 2
}

output "pet" {
  value = random_pet.hcp.id
}
