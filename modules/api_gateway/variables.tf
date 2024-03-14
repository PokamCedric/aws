variable "resource" {
  default     = null
  description = "API resource we want to create"
  type        = string
}

variable "api_description" {
  default     = "API Gateway"
  description = "API Gateway description"
  type        = string
}

variable "methods" {
  default     = []
  description = "API Gateway Methods"
  type        = list(string)
}

variable "stage_name" {
  default     = "Dev"
  description = "API Gateway Deployment Stage Name"
  type        = string
}

variable "inegration_uri" {
  default     = null
  description = "API Gateway Integration URI"
  type        = string
}
