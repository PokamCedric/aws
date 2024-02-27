
################################################################################
# IAM
################################################################################
variable "role" {
  default     = null
  description = "iam role"
  type = object({
    name        = string
    description = string
    body        = any
  })
}

variable "policy" {
  default     = null
  description = "iam policy"
  type = object({
    name        = string
    description = string
    body        = any
  })
}

variable "instance_profile" {
  default     = null
  description = "instance profile name"
  type        = string
}
