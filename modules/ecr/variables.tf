################################################################################
# Repository
################################################################################
variable "repository_name" {
  default     = null
  description = "ECR Repository name"
  type        = string
}

variable "repository_scan_on_push" {
  default     = false
  description = "ECR Repository scan on push"
  type        = bool
}
