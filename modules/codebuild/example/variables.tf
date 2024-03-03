################################################################################
# Environment
################################################################################
variable "region" {
  default     = "us-east-1"
  description = "Region we need to deploy the infrastructure"
  type        = string
}

variable "profile" {
  default     = "terraform-user"
  description = "AWS Profile user"
  type        = string
}

variable "project_name" {
  default     = "techmax"
  description = "Project Name"
  type        = string
}

variable "environment" {
  default     = "Dev"
  description = "Project Environment"
  type        = string
}

################################################################################
# Codebuild Environment
################################################################################
variable "project_description" {
  default     = ""
  description = "Project description"
  type        = string
}

variable "environment_variables" {
  default     = null
  description = "Codebuild Environment Variables"
  type        = map(string)
}

variable "privilege_enabled" {
  description = "Allow Codebuild to have sudo privilege or not"
  type        = bool
  default     = false
}

variable "repository_source" {
  description = "Repository Source"
  type = object({
    type            = string
    location        = string
    version         = string
    git_clone_depth = number

  })
}

variable "access_key" {
  description = "Access key"
  type = object({
    id     = string
    secret = string
  })

}
