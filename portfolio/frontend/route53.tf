module "root_a" {
  source = "../../modules/route53"

  domain_name            = data.aws_acm_certificate.acm.domain
  record_name            = var.record_name
  dns_name               = aws_cloudfront_distribution.s3_distribution.domain_name
  zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
  evaluate_target_health = false
}
