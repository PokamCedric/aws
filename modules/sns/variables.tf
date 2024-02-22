variable "name" {
  default     = null
  description = "SNS topic name"
  type        = string
}

variable "protocol" {
  default     = "email"
  description = "SNS topic notification protocol"
  type        = string
}

variable "endpoint" {
  default     = "aa@bb.cc" # Set a valid endpoint
  description = "SNS topic notification endpoint"
  type        = string
}
