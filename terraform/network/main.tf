terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket          = "terraform-s3-tfstate-bucket"
    key             = "terraform/terraform.tfstate"
    region          = "us-west-1"
    encrypt         = true
    dynamodb_table  = "terraform-lock"
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}
