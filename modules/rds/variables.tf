################################################################################
# Subnet Group
################################################################################
variable "subnet_group_name" {
  default     = "database-subnets"
  description = "Name of the database subnets"
  type        = string
}

variable "subnet_group_description" {
  default     = "Subnets for the Database instance"
  description = "Database subnet group description"
  type        = string
}

variable "subnet_ids" {
  default     = []
  description = "List of the database subnets ids"
  type        = list(string)
}

variable "subnet_group_tags" {
  default = {
    Name = "database-subnets"
  }
  description = "Database subnet group tags"
  type        = map(string)
}

################################################################################
# DB Instance
################################################################################
variable "security_group_ids" {
  default     = []
  description = "Database instance security group ids"
  type        = list(string)
}

variable "availability_zone" {
  default     = null
  description = "Database instance availability zone"
  type        = string
}

variable "db_name" {
  default     = "application-db"
  description = "Database instance Name"
  type        = string

  validation {
    condition     = can(regex("^[A-Za-z]([A-Za-z0-9])*", var.db_name))
    error_message = "DBName must begin with a letter and contain only alphanumeric characters"
  }
}

variable "storage" {
  default     = 10
  description = "Database instance storage"
  type        = number
}

variable "multi_az" {
  default     = false
  description = "Database instance standby"
  type        = bool
}

variable "instance_class" {
  default     = "db.t2.micro"
  description = "Database instance class"
  type        = string
}

variable "instance_identifier" {
  default     = null
  description = "Database instance identifier"
  type        = string
}

variable "engine" {
  default     = "mysql"
  description = "Database instance engine"
  type        = string
}

variable "engine_version" {
  default     = "8.0.31"
  description = "Database instance engine version"
  type        = string
}

################################################################################
# Snapshot
################################################################################
variable "snapshot_identifier" {
  default     = "test-snapshot"
  description = "Snapshot identifier"
  type        = string
}
