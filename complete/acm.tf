module "acm" {
  source = "../modules/acm"

  domain_name       = var.domain_name
  alternative_names = var.alternative_names
}