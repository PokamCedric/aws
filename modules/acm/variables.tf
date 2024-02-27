variable "domain_name" {
  default     = null
  description = "domain name"
  type        = string
}

variable "alternative_names" {
  default     = []
  description = "sub domain names"
  type        = list(string)
}
