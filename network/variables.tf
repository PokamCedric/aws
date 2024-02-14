variable "region" {
  description = "Region we need to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

################################################################################
# VPC
################################################################################

variable "vpc_cidr" {
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}


variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

################################################################################
# Publiс Subnets
################################################################################
variable "public_subnets" {
  description = "This are the public Subnets properties"
  type = list(object({
    name  = string
    cidrs = list(string)
  }))
  default = []
}

variable "private_subnets" {
  description = "This are the private Subnets properties"
  type = list(object({
    name  = string
    cidrs = list(string)
  }))
  default = []
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  type        = bool
  default     = false
}
