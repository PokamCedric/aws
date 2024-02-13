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

variable "public_subnets_list" {
  description = "This are the public Subnets properties"
  type = list(object({
    name  = string
    cidrs = list(string)
  }))
  default = [{ name = "web", cidrs = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"] },
            { name = "jenkins", cidrs = ["172.20.10.0/24", "172.20.11.0/24", "172.20.12.0/24"] }]
}

variable "private_subnets_list" {
  description = "This are the private Subnets properties"
  type = list(object({
    name  = string
    cidrs = list(string)
  }))
  default = [{ name = "app", cidrs = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"] },
  { name = "db", cidrs = ["172.20.7.0/24", "172.20.8.0/24", "172.20.9.0/24"] }]
}

