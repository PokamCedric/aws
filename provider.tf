# Add Providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Get all available AZ's in VPC for master region
data "aws_availability_zones" "azs" {
  state = "available"
}
