################################################################################
# Auto Scaling Group
################################################################################
output "as_name" {
  value       = var.as_name
  description = "Auto Scaling Group name"
}

output "subnet_ids" {
  value       = var.subnet_ids
  description = "Auto Scaling Group subnets ids"
}

output "capacity" {
  value       = var.capacity
  description = "Auto Scaling Group capacity"

}

output "tag" {
  value       = var.tag
  description = "Auto Scaling Group tag"

}

output "health_check_type" {
  value       = var.health_check_type
  description = "Auto Scaling Group health check type"
}


output "lifecycle_ignore_changes" {
  value       = var.lifecycle_ignore_changes
  description = "Auto Scaling Group lifecycle ignore changese"
}

################################################################################
# Launch Template
################################################################################
output "lt_name" {
  value       = var.lt_name
  description = "Launch template name"
}

output "lt_description" {
  value       = var.lt_description
  description = "Launch template for asg"
}

output "ami_id" {
  value       = var.ami_id
  description = "Launch template ami-id"
}

output "instance_type" {
  value       = var.instance_type
  description = "Launch template instance type"
}

output "key_name" {
  value       = var.key_name
  description = "Launch template instance key pair name"
}

output "user_data_path" {
  value       = var.user_data_path
  description = "Path of user data file"
}


output "network" {
  value       = var.network
  description = "Launch Template network interfaces"
}

output "monitoring_enabled" {
  value       = var.monitoring_enabled
  description = "Launch Template monitoring enabled"
}

################################################################################
# Auto Scaling Attachment
################################################################################
output "lb_target_group_arn" {
  value       = var.lb_target_group
  description = "Load Balancer target group arn"
}

################################################################################
# Auto Scaling Notification
################################################################################
output "topic_arn" {
  value       = var.topic
  description = "SNS Topic arn"
}
