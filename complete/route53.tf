module "route53" {
  source = "../modules/route53"

  domain_name               = module.acm.domain_name
  domain_validation_options = module.acm.domain_validation_options
}