variable "region" {
  description = "Region we need to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS Profile user"
  type        = string
  default     = "terraform-user"
}
