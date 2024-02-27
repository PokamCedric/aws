variable "domain_name" {
  default     = null
  description = "domain name"
  type        = string
}

variable "alternative_names" {
  default     = []
  description = "subdomain names"
  type        = list(string)
}
