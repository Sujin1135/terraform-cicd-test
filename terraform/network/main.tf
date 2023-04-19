terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  cloud {
    organization = "kemi-team-backend"

    workspaces {
      name = "mango"
    }
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}
