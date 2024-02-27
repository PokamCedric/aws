output "record_fqdns" {
  value       = [for record in aws_route53_record.this : record.fqdn]
  description = "record fqdn"
}