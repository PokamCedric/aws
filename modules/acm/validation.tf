# validate acm certificates
resource "aws_acm_certificate_validation" "this" {
  certificate_arn = aws_acm_certificate.this.arn
}