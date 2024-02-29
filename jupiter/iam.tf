module "iam_execution_role_policy" {
  source = "../modules/iam"

  role             = var.execution_role
  policy_arn       = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  instance_profile = "${var.project_name}-${var.execution_role_name}-instance-profile"
}
