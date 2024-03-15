# Add Providers
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
