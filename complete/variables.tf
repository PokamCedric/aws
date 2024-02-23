variable "region" {
  description = "Region we need to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS Profile user"
  type        = string
  default     = "terraform-user"
}

variable "azs_count" {
  default     = 2
  description = "Number of availability zones to use"
  type        = number
}

################################################################################
# Network
################################################################################
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
