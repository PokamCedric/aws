# Initialize the Terraform awscc provider with local state
terraform {
  required_providers {
    aws = { # Used t create VPC
      source = "hashicorp/aws"
    }
    awscc = { # Used t create IPAM
      source = "hashicorp/awscc"
    }
  }
}

provider "aws" {
  region = "us-east-1" # for the 1st VPC
  alias  = "useast2"   # for the 2nd VPC
}

provider awscc {
  region = "us-east-1"
}
