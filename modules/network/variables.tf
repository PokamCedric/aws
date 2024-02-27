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

variable "azs_names" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "azs_count" {
  default     = 1
  description = "Number of availability zones to use"
  type        = number

  validation {
    condition     = var.azs_count > 0
    error_message = "Number of Availability Zone should be greater zero"
  }
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
  description = "VPC tags"
  type        = map(string)
  default     = {}
}

variable "ipv4_ipam_pool_id" {
  description = "(Optional) The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR"
  type        = string
  default     = null
}

variable "ipv4_netmask_length" {
  description = "(Optional) The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id"
  type        = number
  default     = null
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

variable "public_subnet_map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `true`"
  type        = bool
  default     = true
}

################################################################################
# Private Subnets
################################################################################
variable "private_subnets" {
  description = "This are the private Subnets properties"
  type = list(object({
    name  = string
    cidrs = list(string)
  }))
  default = []
}

variable "private_subnet_map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  type        = bool
  default     = false
}

################################################################################
# IGW
################################################################################
variable "igw_tags" {
  default     = { Name = "Dev IGW" }
  description = "IGW tags"
  type        = map(string)
}
