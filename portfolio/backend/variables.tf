
variable "project_name" {
  default     = "website"
  description = "Project name"
  type        = string
}

variable "resource" {
  default     = "VisitorCount"
  description = "API resource we want to create"
  type        = string
}
