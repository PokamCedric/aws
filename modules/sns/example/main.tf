module "sns" {
  source = "../"

  name     = "dev-sns-topic"
  protocol = "email"
  endpoint = "aa@bb.fr"
}