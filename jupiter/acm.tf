# Find a certificate that is issued
data "aws_acm_certificate" "acm" {
  domain   = var.domain_name
  statuses = ["ISSUED"]
}
