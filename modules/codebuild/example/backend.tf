# Terraform configuration
terraform {
  required_version = ">= 1.0"

  # Add Providers
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20"
    }
  }

  # Store the terraform state file in s3
  backend "s3" {
    bucket  = "terraform-state-for-terraform-user"
    key     = "build/terraform.tfstate.dev"
    region  = "us-east-1"
    profile = "terraform-user"
  }
}
