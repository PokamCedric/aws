################################################################################
# Auto Scaling Group
################################################################################
variable "as_name" {
  default     = "dev-asg"
  description = "Auto Scaling Group name"
  type        = string
}

variable "subnet_ids" {
  default     = []
  description = "Auto Scaling Group subnets ids"
  type        = list(string)
}

variable "capacity" {
  default = {
    desired_capacity = 1
    min_size         = 1
    max_size         = 1
  }
  description = "Auto Scaling Group capacity"
  type = object({
    desired_capacity = number
    min_size         = number
    max_size         = number
  })
}

variable "tag" {
  default = {
    key                 = "Name"
    value               = "asg-server"
    propagate_at_launch = true
  }
  description = "Auto Scaling Group tag"
  type = object({
    key                 = string
    value               = string
    propagate_at_launch = bool
  })
}

variable "health_check_type" {
  default     = "ELB"
  description = "Auto Scaling Group health check type"
  type        = string
}


variable "lifecycle_ignore_changes" {
  default     = null
  description = "Auto Scaling Group lifecycle ignore changese"
  type        = bool
}

################################################################################
# Launch Template
################################################################################
variable "lt_name" {
  default     = "launch-template"
  description = "Launch template name"
  type        = string
}

variable "lt_description" {
  default     = "launch-template"
  description = "Launch template for asg"
  type        = string
}

variable "ami_id" {
  default     = null
  description = "Launch template ami-id"
  type        = string
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Launch template instance type"
  type        = string
}

variable "key_name" {
  default     = null
  description = "Launch template instance key pair name"
  type        = string
}

variable "user_data_path" {
  default     = null
  description = "Path of user data file"
  type        = string
}


variable "network" {
  default = {
    associate_public_ip_address = false # default no internet facing
    security_group_ids          = []
  }
  description = "Launch Template network interfaces"
  type = object({
    associate_public_ip_address = bool
    security_group_ids          = list(string)
  })
}

variable "monitoring_enabled" {
  default     = true
  description = "Launch Template monitoring enabled"
  type        = bool
}

################################################################################
# Auto Scaling Attachment
################################################################################
variable "lb_target_group" {
  default = {
    enabled = false
    arn     = ""
  }
  description = "Load Balancer target group arn"
  type = object({
    enabled = bool
    arn     = string
  })
}

################################################################################
# Auto Scaling Notification
################################################################################
variable "topic" {
  default = {
    enabled = false
    arn     = ""
  }
  description = "SNS Topic arn"
  type = object({
    enabled = bool
    arn     = string
  })
}
