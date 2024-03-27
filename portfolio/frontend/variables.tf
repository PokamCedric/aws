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

# variable "file_source_path" {
#   description = "S3 Object Source file"
#   type        = string
# }

################################################################################
# Hosting
################################################################################
variable "bucket_id" {
  default     = null
  description = "Bucket"
}

variable "bucket_arn" {
  default     = null
  description = "Bucket arn"
}

################################################################################
# ACM
################################################################################
variable "domain_name" {
  description = "domain name"
  type        = string
}

variable "alternative_names" {
  description = "sub domain names"
  type        = list(string)
}

################################################################################
# Route 53
################################################################################
variable "record_name" {
  description = "sub domain name"
  type        = string
}
