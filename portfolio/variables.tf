################################################################################
# Environment
################################################################################
variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
}

################################################################################
# IAM
################################################################################
variable "iam_role_for_lambda" {
  description = "iam role for lambda"
  type = object({
    name        = string
    description = string
    body        = any
  })
}

variable "iam_policy_for_lambda" {
  description = "iam policy for lambda"
  type = object({
    name        = string
    description = string
    body        = any
  })
}

variable "file_source_path" {
  description = "S3 Object Source file"
  type        = string
}
