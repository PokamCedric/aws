variable "region" {
  default     = "us-east-1"
  description = "region to deploy the infrastructure"
  type        = string
}

variable "project_name" {
  default     = "product-api"
  description = "Project name"
  type        = string
}

variable "resource" {
  default     = "product"
  description = "API resource we want to create"
  type        = string
}

variable "api_description" {
  default     = "Product API Gateway"
  description = "API Gateway description"
  type        = string
}

variable "methods" {
  default     = []
  description = "API Gateway Methods"
  type        = list(string)
}