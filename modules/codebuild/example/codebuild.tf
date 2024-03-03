module "codebuild" {
  source = "../"

  project_name        = var.project_name
  project_description = var.project_description
  environment         = var.environment

  environment_variables = {
    "PROFILE_NAME"          = var.profile
    "AWS_ACCESS_KEY_ID"     = var.access_key.id
    "AWS_SECRET_ACCESS_KEY" = var.access_key.secret
    "AWS_REGION"            = var.region
  }

  repository_source = var.repository_source
  privilege_enabled = var.privilege_enabled

  S3_logs_status   = "ENABLED"
  S3_logs_location = "terraform-state-for-terraform-user/${var.project_name}"
}