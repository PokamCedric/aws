output "domain_name" {
  value       = aws_acm_certificate.this.domain_name
  description = "domain name"
}

output "certificate_arn" {
  value       = aws_acm_certificate.this.arn
  description = "certificate arn"
}

output "domain_validation_options" {
  value       = aws_acm_certificate.this.domain_validation_options
  description = "domain validation options"
}

output "certificate_validation_arn" {
  value       = aws_acm_certificate_validation.this.certificate_arn
  description = "certificate validation arn"
}
