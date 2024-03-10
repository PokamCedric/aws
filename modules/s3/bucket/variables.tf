################################################################################
# Environment
################################################################################
variable "environment" {
  default     = "Dev"
  description = "Environment name"
  type        = string
}

variable "project_name" {
  default     = null
  description = "Project name"
}

################################################################################
# Bucket
################################################################################
variable "bucket_name" {
  default     = null
  description = "Bucket name"
}

variable "bucket_tags" {
  default = {}
  type    = map(string)
}
