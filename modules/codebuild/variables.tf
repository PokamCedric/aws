
################################################################################
# Environment
################################################################################
variable "project_name" {
  default     = null
  description = "Project name"
  type        = string
}

variable "project_description" {
  default     = ""
  description = "Project description"
  type        = string
}

variable "environment" {
  default     = null
  description = "Project environment"
  type        = string
}

variable "privilege_enabled" {
  description = "Allow Codebuild to have sudo privilege or not"
  type        = bool
  default     = false
}

################################################################################
# Codebuild Environment
################################################################################
variable "environment_variables" {
  description = "environment variables"
}

variable "image" {
  description = "image"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
}

variable "repository_source" {
  description = "Repository Source"
  type = object({
    type            = string
    location        = string
    version         = string
    git_clone_depth = number

  })

}

################################################################################
# Logs Config
################################################################################
variable "S3_logs_status" {
  description = "S3 Logs status"
  type        = string
  default     = "DISABLED"
}

variable "S3_logs_location" {
  description = "S3 Logs Location"
  type        = string
  default     = null
}

variable "cloudwatch_logs_group_name" {
  description = "cloudwatch logs group name"
  type        = string
  default     = null
}

variable "cloudwatch_logs_stream_name" {
  description = "cloudwatch logs stream name"
  type        = string
  default     = null
}

################################################################################
# VPC Config
################################################################################
variable "vpc_id" {
  description = "VPC id"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "subnet ids"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "security group ids"
  type        = list(string)
  default     = []
}
