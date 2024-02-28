output "topic_arn" {
  value       = aws_sns_topic.this.arn
  description = "SNS Topic arn"
}
