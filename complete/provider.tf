# Configure the AWS Provider
provider "aws" {
  region  = var.region
  profile = var.profile

  default_tags {
    tags = {
      "Automation"  = "terraform"
      "Project"     = var.project_name
      "Environment" = var.environment
    }
  }
}

# Get all available AZ's in VPC for master region
data "aws_availability_zones" "azs" {
  state = "available"
}
