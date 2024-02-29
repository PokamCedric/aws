module "route53" {
  source = "../modules/route53"

  domain_name  = data.aws_acm_certificate.acm.domain
  record_name  = var.record_name
  alb_dns_name = module.alb.dns_name
  alb_zone_id  = module.alb.zone_id
}