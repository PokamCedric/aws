# Find a certificate that is issued
data "aws_acm_certificate" "acm" {
  domain   = var.domain_name
  statuses = ["ISSUED"]
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = data.aws_acm_certificate.acm.arn
}