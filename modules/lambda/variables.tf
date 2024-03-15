################################################################################
# Archive
################################################################################
variable "source_dir" {
  default     = null
  description = "Lambda function source directory"
  type        = string
}

variable "output_path" {
  default     = null
  description = "Lambda function output path"
  type        = string
}

################################################################################
# aws_lambda_function
################################################################################
variable "function_name" {
  default     = null
  description = "Lambda function name"
  type        = string
}

variable "handler" {
  default     = null
  description = "Lambda function handler"
  type        = string
}

variable "runtime" {
  default     = null
  description = "Lambda function runtime"
  type        = string
}

variable "variables" {
  default     = {}
  description = "Lambda function environment variables"
  type        = map(string)
}

variable "role" {
  default     = null
  description = "Lambda function role"
  type        = string
}

variable "timeout" {
  default     = 3 # default lambda timeout is 3s
  description = "Lambda function timeout"
  type        = number
}

variable "memory_size" {
  default     = 128
  description = "Lambda memory size"
  type        = number
}

################################################################################
# aws_lambda_permission
################################################################################
variable "principal" {
  default     = null
  description = "Lambda permission principal"
  type        = string
}

variable "source_arn" {
  default     = ""
  description = "Lambda permission source arn"
  type        = string
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Map of tags to apply to resources"
}
