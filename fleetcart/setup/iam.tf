module "iam_bucket_role_policy" {
  source = "../modules/iam"

  role             = var.role
  policy           = var.policy
  instance_profile = "fleetcart_web_instance_profile"

}
