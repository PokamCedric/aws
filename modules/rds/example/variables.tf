variable "region" {
  description = "Region we need to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}


variable "azs_count" {
  default     = 2
  description = "Number of availability zones to use"
  type        = number
}
