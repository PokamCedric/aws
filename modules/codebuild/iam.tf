locals {
  # These are the possibles AWS managed codebuild policy
  CodeBuildReadOnlyAccess  = "arn:aws:iam::aws:policy/AWSCodeBuildReadOnlyAccess"
  CodeBuildDeveloperAccess = "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess"
  CodeBuildAdminAccess     = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"

  # Service to apply role
  execution_role_service = "codebuild"
}

module "iam_service_role_policy" {
  source = "../iam"

  policy_arn       = local.CodeBuildAdminAccess
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
            "Service" : "${local.execution_role_service}.amazonaws.com"
          },
          "Effect" : "Allow",
          "Sid" : ""
        }
      ]
    }
  }
}

