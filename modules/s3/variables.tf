variable "environment" {
  default     = "Dev"
  description = "Environment name"
  type        = string
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

################################################################################
# Object
################################################################################
variable "file_source_path" {
  default     = null
  description = "File Source Path"
  type        = string
}

variable "file_destination_path" {
  default     = null
  description = "File Destination Path"
  type        = string
}
