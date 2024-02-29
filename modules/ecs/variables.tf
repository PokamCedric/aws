################################################################################
# Environment
################################################################################
variable "project_name" {
  default     = null
  description = "Project name"
  type        = string
}
variable "environment" {
  default     = null
  description = "Project environment"
  type        = string
}

################################################################################
# Cluster
################################################################################
variable "cluster_name" {
  default     = null
  description = "ECS Cluster name"
  type        = string
}

################################################################################
# Task definition
################################################################################
variable "task_definition_family" {
  default     = "service"
  description = "ECS family"
  type        = string
}

variable "network_mode" {
  default     = "awsvpc"
  description = "ECS network mode"
  type        = string
}

variable "infrastructures" {
  default     = ["FARGATE"]
  description = "ECS infrastructures"
  type        = list(string)
}

variable "cpu" {
  default     = 256
  description = "ECS CPU"
  type        = number
}

variable "memory" {
  default     = 512
  description = "ECS Memory"
  type        = number
}

variable "execution_role_arn" {
  default     = null
  description = "ECS execution role arn"
  type        = string
}

variable "task_role_arn" {
  default     = null
  description = "ECS task role arn"
  type        = string
}

variable "container_name" {
  default     = null
  description = "ECS Container name"
  type        = string
}

variable "container_image" {
  default     = null
  description = "ECS Container image name"
  type        = string
}

variable "container_image_version" {
  default     = "latest"
  description = "ECS Container image version"
  type        = string
}

variable "container_environment" {
  default     = null
  description = "ECS Container environment"
  type        = string
}

variable "container_port_mapping" {
  default     = null
  description = "ECS Container port mapping"
  type = object({
    protocol      = string
    containerPort = number
    hostPort      = number
  })
}

variable "runtime_platform" {
  default     = null
  description = "ECS Container operating system and cpu architecture"
  type = object({
    operating_system = string
    cpu_architecture = string
  })
}

################################################################################
# Service
################################################################################
variable "service_name" {
  default     = null
  description = "ECS Service name"
  type        = string
}

variable "desired_count" {
  default     = 1
  description = "ECS Service desired count"
  type        = number
}

variable "deployment" {
  default = {
    min = 100
    max = 200
  }
  description = "ECS Service deployment healthy percent"
  type = object({
    min = number
    max = number
  })
}

variable "launch_type" {
  default     = "FARGATE"
  description = "ECS Service launch type"
  type        = string
}

variable "scheduling_strategy" {
  default     = "REPLICA"
  description = "ECS Service scheduling strategy"
  type        = string
}

variable "security_groups" {
  default     = []
  description = "ECS Service security group ids"
  type        = list(string)
}

variable "subnet_ids" {
  default     = []
  description = "ECS Service subnet ids"
  type        = list(string)
}

variable "target_group_arn" {
  default     = null
  description = "ECS Service target group arn"
  type        = string
}
