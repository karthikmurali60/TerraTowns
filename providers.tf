terraform {
  cloud {
    organization = "karthik_terraform"

    workspaces {
      name = "terrahouse"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}
