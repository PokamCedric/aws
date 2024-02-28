################################################################################
# Environment
################################################################################
variable "region" {
  description = "Region we need to deploy the infrastructure"
  type        = string
}

variable "profile" {
  description = "AWS Profile user"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Project Environment"
  type        = string
}

################################################################################
# ECR
################################################################################
variable "ecr_repository_name" {
  description = "ECR Repository name"
  type        = string
}
