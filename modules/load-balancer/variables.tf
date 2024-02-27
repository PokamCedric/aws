################################################################################
# Load Balancer
################################################################################
variable "lb_name" {
  default     = "dev-alb"
  description = "Load Balancer Name"
  type        = string
}

variable "internal" {
  default     = false # False because the Load Balancer will face internet
  description = "When internal the Load Balancer doesn't face internet"
  type        = bool
}

variable "lb_type" {
  default     = "application"
  description = "Load Balancer type"
  type        = string
}

variable "security_group_ids" {
  default     = []
  description = "Load Balancer security group ids"
  type        = list(string)
}

variable "subnet_ids" {
  default     = []
  description = "Load Balancer subnet mapping"
  type        = list(string)
}

variable "deletion_protection" {
  default     = false
  description = "Protect the Load Balancer from deletion"
  type        = bool
}

variable "lb_tags" {
  default     = { Name = "dev-alb" }
  description = "Additional Load Balancer tags"
  type        = map(string)
}

################################################################################
# Target Group
################################################################################
variable "vpc_id" {
  default     = null
  description = "VPC ID"
  type        = string
}

variable "tg_name" {
  default     = "dev-tg"
  description = "Target Group Name"
  type        = string
}

variable "tg_type" {
  default     = "instance"
  description = "Target Group type"
  type        = string
}

variable "tg_port" {
  default = {
    id       = 80
    protocol = "HTTP"
  }
  description = "Target Group port"
  type = object({
    id       = number
    protocol = string
  })
}

################################################################################
# Target Group - Health Check
################################################################################
variable "hc_port" {
  default = {
    id       = "traffic-port"
    protocol = "HTTP"
  }
  description = "Health Check port"
  type = object({
    id       = string
    protocol = string
  })
}

variable "healthy_threshold" {
  default     = 5
  description = "Health Check healthy threshold"
  type        = number
}

variable "unhealthy_threshold" {
  default     = 2
  description = "Health Check unhealthy threshold"
  type        = number
}

variable "interval" {
  default     = 30
  description = "Health Check interval"
  type        = number
}

variable "timeout" {
  default     = 5
  description = "Health Check timeout"
  type        = number
}

variable "matcher" {
  default     = "200,301,302"
  description = "Health Check matcher"
  type        = string
}

variable "path" {
  default     = "/"
  description = "Health Check path"
  type        = string
}

################################################################################
# Target Group Attachment
################################################################################
variable "target_instances" {
  default     = []
  description = "Instances to attach"
  type = list(object({
    id   = string
    port = number
  }))
}

################################################################################
# Listeners
################################################################################
variable "certificate_arn" {
  default     = null
  description = "SSL Certificate arn"
  type        = string
}

variable "alb_fa_listener_count" {
  default     = 0
  description = "Application LB Forward Action Listener count"
  type        = number
}

variable "nlb_fa_listener_count" {
  default     = 0
  description = "Network LB Forward Action Listener count"
  type        = number
}

variable "glb_fa_listener_count" {
  default     = 0
  description = "Gateway LB Forward Action Listener count"
  type        = number
}

variable "ra_listener_count" {
  default     = 0
  description = "Redirect Action Listener count"
  type        = number
}
