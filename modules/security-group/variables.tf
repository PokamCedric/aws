variable "region" {
  description = "Region we need to deploy the infrastructure"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
  default     = null
}

variable "name" {
  description = "Security Group name"
  type        = string
  default     = "sg"
}
variable "description" {
  description = "Security Group description"
  type        = string
  default     = "Allow traffic on the given ports"
}

variable "ports" {
  description = "Ports to allow traffic"
  type        = list(number)
  default     = []
}

variable "source" {
  description = "inbound sources"
  type        = list(string)
  default       = ["0.0.0.0/0"]
}
variable "tags" {
  description = "Additional tags for the security-group"
  type        = map(string)
  default     = {}
}
