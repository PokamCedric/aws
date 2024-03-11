variable "domain_name" {
  default     = null
  description = "domain name"
  type        = string
}

variable "record_name" {
  default     = null
  description = "sub domain name"
  type        = string
}

variable "dns_name" {
  default     = null
  description = "alb dns name"
  type        = string
}

variable "zone_id" {
  default     = null
  description = "alb hosted zone"
  type        = string
}