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

variable "ami_id" {
  description = "Launch template ami-id"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "List of the subnets ids"
  type        = list(string)
  default     = []
}

variable "user_data_path" {
  description = "Path of user data file"
  type        = string
  default     = null
}

variable "sg_ids" {
  description = "Launch Template security-group ids"
  type        = list(string)
  default     = []
}
