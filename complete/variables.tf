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
  default     = 2
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
  default = [
    { name = "", # End name would be "public--subnet-azname"
    cidrs = ["10.0.0.0/24", "10.0.1.0/24"] }
  ]
}

variable "private_subnets" {
  description = "This are the private Subnets properties"
  type = list(object({
    name  = string
    cidrs = list(string)
  }))
  default = [
    { name = "app", # End name would be "private-app-subnet-azname"
    cidrs = ["10.0.2.0/24", "10.0.3.0/24"] },
    { name = "db", # End name would be "private-db-subnet-azname"
    cidrs = ["10.0.4.0/24", "10.0.5.0/24"] }
  ]
}

################################################################################
# Security Groups
################################################################################
variable "alb_sg_ports" {
  description = "Security Group ports for the Application Load Balancer"
  type        = list(number)
  default     = [80, 443]
}

variable "bh_sg_ports" {
  description = "Security Group ports for the Bastion Host"
  type        = list(number)
  default     = [22]
}

variable "web_sg_ports" {
  description = "Security Group ports for the Web Server"
  type        = list(number)
  default     = [80, 443]
}

variable "db_sg_ports" {
  description = "Security Group ports for the Database Server"
  type        = list(number)
  default     = [80, 443]
}

################################################################################
# IAM
################################################################################
variable "role" {
  default = {
    name        = "fleetcart_web_role"
    description = null
    body = {
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Sid    = ""
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        },
      ]
    }
  }
  description = "iam role"
  type = object({
    name        = string
    description = string
    body        = any
  })
}

variable "policy" {
  default = {
    name        = "fleetcart_web_bucket_policy"
    description = "Allow"
    body = {
      Version : "2012-10-17",
      Statement : [
        {
          Effect : "Allow",
          Action : [
            "s3:GetObject",
            "s3:ListBucket",
          ],
          Resource : [
            "arn:aws:s3:::*/*",
            "arn:aws:s3:::mydemoacloudgurus3bucket",
            "arn:aws:s3:::cedricpokam-fleetcart-bucket"
          ]
        }
      ]
    }
  }
  description = "iam policy"
  type = object({
    name        = string
    description = string
    body        = any
  })
}

################################################################################
# ACM
################################################################################
variable "domain_name" {
  description = "domain name"
  type        = string
}

variable "alternative_names" {
  description = "subdomain names"
  type        = list(string)
}

################################################################################
# ROUTE%§
################################################################################
variable "record_name" {
  description = "subdomain name"
  type        = string
}
