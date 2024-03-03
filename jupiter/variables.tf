################################################################################
# Environment
################################################################################
variable "region" {
  description = "Region we need to deploy the infrastructure"
  type        = string
}

variable "profile" {
  description = "AWS Profile user"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Project Environment"
  type        = string
}

################################################################################
# Network
################################################################################
variable "azs_count" {
  description = "Number of availability zones to use"
  type        = number
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "This are the public Subnets properties"
  type = list(object({
    name  = string
    cidrs = list(string)
  }))
}

variable "private_subnets" {
  description = "This are the private Subnets properties"
  type = list(object({
    name  = string
    cidrs = list(string)
  }))
}

################################################################################
# ECS
################################################################################
variable "container_port_mapping" {
  description = "ECS Container port mapping"
  type = object({
    protocol      = string
    containerPort = number
    hostPort      = number
  })
}

variable "runtime_platform" {
  description = "ECS Container operating system and cpu architecture"
  type = object({
    operating_system = string
    cpu_architecture = string
  })
}

################################################################################
# ECR
################################################################################
variable "registry_id" {
  description = "ECR Registry id"
  type        = string
}

################################################################################
# ACM
################################################################################
variable "domain_name" {
  description = "domain name"
  type        = string
}

variable "alternative_names" {
  description = "sub domain names"
  type        = list(string)
}

################################################################################
# Route 53
################################################################################
variable "record_name" {
  description = "sub domain name"
  type        = string
}
