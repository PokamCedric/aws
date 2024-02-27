# get details about a route 53 hosted zone
data "aws_route53_zone" "this" {
  name         = var.domain_name
  private_zone = false
}
