################################################################################
# Load Balancer
################################################################################
output "lb_name" {
  value       = var.lb_name
  description = "Load Balancer Name"
}

output "internal" {
  value       = var.internal
  description = "When internal the Load Balancer doesn't face internet"
}

output "lb_type" {
  value       = var.lb_type
  description = "Load Balancer type"
}

output "security_group_ids" {
  value       = var.security_group_ids
  description = "Load Balancer security group ids"
}

output "subnet_ids" {
  value       = var.subnet_ids
  description = "Load Balancer subnet mapping"
}

output "deletion_protection" {
  value       = var.deletion_protection
  description = "Protect the Load Balancer from deletion"
}

output "lb_tags" {
  value       = var.lb_tags
  description = "Additional Load Balancer tags"
}

################################################################################
# Target Group
################################################################################
output "vpc_id" {
  value       = var.vpc_id
  description = "VPC ID"
}

output "tg_name" {
  value       = var.tg_name
  description = "Target Group Name"
}

output "tg_type" {
  value       = var.tg_type
  description = "Target Group type"
}

output "tg_port" {
  value       = var.tg_port
  description = "Target Group port"
}

################################################################################
# Target Group - Health Check
################################################################################
output "hc_port" {
  value       = var.hc_port
  description = "Health Check port"
}

output "healthy_threshold" {
  value       = var.healthy_threshold
  description = "Health Check healthy threshold"
}

output "unhealthy_threshold" {
  value       = var.unhealthy_threshold
  description = "Health Check unhealthy threshold"
}

output "interval" {
  value       = var.interval
  description = "Health Check interval"
}

output "timeout" {
  value       = var.timeout
  description = "Health Check timeout"
}

output "matcher" {
  value       = var.matcher
  description = "Health Check matcher"
}

output "path" {
  value       = var.path
  description = "Health Check path"
}

################################################################################
# Listeners
################################################################################
output "certificate_arn" {
  value       = var.certificate_arn
  description = "SSL Certificate arn"
}

output "alb_fa_listener_count" {
  value       = var.alb_fa_listener_count
  description = "Application LB Forward Action Listener count"
}

output "nlb_fa_listener_count" {
  value       = var.nlb_fa_listener_count
  description = "Network LB Forward Action Listener count"
}

output "glb_fa_listener_count" {
  value       = var.glb_fa_listener_count
  description = "Gateway LB Forward Action Listener count"
}

output "ra_listener_count" {
  value       = var.ra_listener_count
  description = "Redirect Action Listener count"
}
