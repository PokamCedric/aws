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
    body = {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : "sts:AssumeRole",
          "Principal" : {
            "Service" : "${execution_role_service}.amazonaws.com"
          },
          "Effect" : "Allow",
          "Sid" : ""
        }
      ]
    }
  }
}
