# fetching current account id
data "aws_caller_identity" "current" {}

locals {
  environment = "${var.project_name}-${var.environment}"
  account_id  = data.aws_caller_identity.current.account_id
}

module "s3_bucket_source" {
  source = "../modules/s3/bucket"

  environment  = var.environment
  project_name = var.project_name

  bucket_name = "${local.environment}-bucket-src"
  bucket_tags = {
    Name = "bucket-src"
  }
}
