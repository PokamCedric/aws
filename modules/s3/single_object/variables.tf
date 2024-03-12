################################################################################
# Bucket
################################################################################
variable "bucket" {
  default     = null
  description = "Bucket"
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
