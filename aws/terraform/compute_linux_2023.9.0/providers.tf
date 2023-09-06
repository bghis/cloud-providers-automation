terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.15.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.location
  profile = var.profile
}