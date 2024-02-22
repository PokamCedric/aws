variable "region" {
  description = "Region we need to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "azs_count" {
  default     = 3
  description = "Number of AZs we need"
  type        = number
}