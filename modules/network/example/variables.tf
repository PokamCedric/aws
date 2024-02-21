variable "region" {
  description = "Region we need to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "az_count" {
  default     = 1
  description = "Number of AZ we need"
  type        = number
}