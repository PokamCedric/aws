# request public certificates from the amazon certificate manager.
resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  subject_alternative_names = var.alternative_names
  validation_method         = "DNS" # The validation comes from the DNS route53

  lifecycle {
    create_before_destroy = true # destroy the resource before creating a new one
  }
}
