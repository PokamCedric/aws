variable "tags" {
  default     = {}
  description = "Tags for the instance"
  type        = map(string)
}

variable "volume_size" {
  default     = 8
  description = "root block volume size"
  type        = number
}

variable "ami_id" {
  default     = null
  description = "ami-id"
  type        = string
}

variable "instance_type" {
  default     = "t2.micro"
  description = "instance type"
  type        = string
}

variable "key_name" {
  default     = null
  description = "instance key pair name"
  type        = string
}

variable "user_data_path" {
  default     = null
  description = "Path of user data file"
  type        = string
}

variable "security_group_ids" {
  default     = []
  description = "network interfaces"
  type        = list(string)
}

variable "subnet_id" {
  default     = null
  description = "Subnet id"
  type        = string
}

variable "iam_instance_profile" {
  default     = null
  description = "instance profile name"
  type        = string
}
