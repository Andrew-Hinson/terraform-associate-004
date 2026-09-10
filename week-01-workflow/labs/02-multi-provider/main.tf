terraform {
  required_version = ">= 1.12.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "random" {}

provider "random" {
  alias = "extra"
}

resource "random_pet" "default" {
  length = 2
}

resource "random_pet" "aliased" {
  provider = random.extra
  length   = 3
}

resource "local_file" "names" {
  filename = "${path.module}/names.txt"
  content  = "${random_pet.default.id}\n${random_pet.aliased.id}\n"
}
