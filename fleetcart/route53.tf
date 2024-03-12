module "route53" {
  source = "../modules/route53"

  domain_name            = module.acm.domain_name
  record_name            = var.record_name
  dns_name               = module.alb.dns_name
  zone_id                = module.alb.zone_id
  evaluate_target_health = true
}