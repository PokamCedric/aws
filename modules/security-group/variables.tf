variable "ports" {
    description = "List of Ports"
    type = list(number)
    default = [22, 80, 8080]
}

variable "sg_tags" {
  description = "Additional tags for the security group"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "VPC-id"
  type        = string
  default     = null
}

variable "sg_name" {
  description = "VPC-id"
  type        = string
  default     = "sg"
}

variable "sg_desc" {
  description = "VPC-id"
  type        = string
  default     = "Allow TCP/80 & TCP/22"
}
