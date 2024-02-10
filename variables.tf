variable "vpc_cidr" {
  default     = "172.20.0.0/20"
  description = "This is the CIDR of the VPC"
}

variable "public_web_subnets_cidr" {
  type        = list(string)
  description = "This is the CIDR of the public web Subnets"
  default     = ["172.20.1.0/24", "172.20.2.0/24"]
}

variable "private_app_subnets_cidr" {
  type        = list(string)
  description = "This is the CIDR of the private app Subnets"
  default     = ["172.20.3.0/24", "172.20.4.0/24"]
}

variable "private_db_subnets_cidr" {
  type        = list(string)
  description = "This is the CIDR of the private db Subnets"
  default     = ["172.20.5.0/24", "172.20.6.0/24"]
}
