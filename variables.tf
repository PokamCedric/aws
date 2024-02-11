variable "region" {
  description = "Region we need to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "This is the CIDR of the VPC"
  type        = string
  default     = "172.20.0.0/20"
}

variable "public_web_subnets_cidr" {
  description = "This are the CIDRs of the public web Subnets"
  type        = list(string)
  default     = ["172.20.1.0/24", "172.20.2.0/24"]
}

variable "private_app_subnets_cidr" {
  description = "This are the CIDRs of the private app Subnets"
  type        = list(string)
  default     = ["172.20.3.0/24", "172.20.4.0/24"]
}

variable "private_db_subnets_cidr" {
  description = "This are the CIDRs of the private db Subnets"
  type        = list(string)
  default     = ["172.20.5.0/24", "172.20.6.0/24"]
}
