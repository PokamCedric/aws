variable "domain_name" {
  default     = null
  description = "domain name"
  type        = string
}

variable "record_name" {
  default     = null
  description = "subdomain name"
  type        = string
}

variable "dns_name" {
  default     = null
  description = "dns name"
  type        = string
}

variable "zone_id" {
  default     = null
  description = "hosted zone"
  type        = string
}

variable "evaluate_target_health" {
  default     = false
  description = "evaluate_target_health option"
  type        = bool
}