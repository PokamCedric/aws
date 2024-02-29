################################################################################
# ECR Repository
################################################################################
variable "name" {
  default     = null
  description = "ECR Repository name"
  type        = string
}

variable "scan_on_push" {
  default     = false
  description = "ECR Repository scan on push"
  type        = bool
}

################################################################################
# ECR Lifecycle Policy
################################################################################
variable "max_images_count" {
  default     = 10
  description = "ECR max image count number policy"
  type        = number
}
