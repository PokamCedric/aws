output "lb_target_group_arn" {
  value       = aws_lb_target_group.this.arn
  description = "Target Group arn"
}

output "dns_name" {
  value       = aws_lb.this.dns_name
  description = "LB DNS name"
}

output "zone_id" {
  value       = aws_lb.this.zone_id
  description = "LB Hosted zone"
}
