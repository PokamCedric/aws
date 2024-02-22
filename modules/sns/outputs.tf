output "topic_arn" {
  value       = aws_sns_topic.this.arn
  description = "SNS Topic arn"
}

output "name" {
  value       = var.name
  description = "SNS topic name"
}

output "protocol" {
  value       = var.protocol
  description = "SNS topic notification protocol"
}

output "endpoint" {
  value       = var.endpoint
  description = "SNS topic notification endpoint"
}
