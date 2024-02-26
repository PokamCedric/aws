module "iam_bucket_role_policy" {
  source = "../"

  instance_profile = "fleetcart_web_ip"
  role             = var.role
  policy           = var.policy

}
