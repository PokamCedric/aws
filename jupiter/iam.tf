locals {
  # Service to apply role
  execution_role_service = "ecs-tasks"
}

module "iam_execution_role_policy" {
  source = "../modules/iam"

  policy_arn       = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  instance_profile = "${var.project_name}-instance-profile"
  role = {
    name        = "${local.execution_role_service}-execution-role"
    description = null
    body        = <<EOF
{
        "Version" : "2012-10-17",
        "Statement" : [
          {
            "Action" : "sts:AssumeRole",
            "Effect" : "Allow",
            "Sid"    : "",
            "Principal" : {
              "Service" : "${local.execution_role_service}.amazonaws.com"
            }
          }
        ]
}
EOF
  }
}
