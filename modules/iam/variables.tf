
################################################################################
# IAM
################################################################################
variable "role" {
  default     = null
  description = "iam role"
  type = object({
    name        = string
    description = string
    body        = string
  })
}

variable "policy_arn" {
  default     = null
  description = "iam policy arn"
  type        = string
}

variable "policy" {
  default     = null
  description = "iam policy"
  type = object({
    name        = string
    description = string
    body        = string
  })
}

variable "instance_profile" {
  default     = null
  description = "instance profile name"
  type        = string
}
