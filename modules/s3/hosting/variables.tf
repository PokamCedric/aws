################################################################################
# Hosting
################################################################################
variable "bucket_id" {
  default     = null
  description = "Bucket"
  type        = string
}

variable "bucket_arn" {
  default     = null
  description = "Bucket arn"
  type        = string
}

variable "block_public_access" {
  default     = true
  description = "Block S3 Bucket Pulbic Access"
  type        = bool
}

variable "cloudfront_distribution_arn" {
  default     = null
  description = "Block S3 Bucket Pulbic Access"
  type        = string
}
