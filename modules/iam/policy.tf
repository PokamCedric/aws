locals {
  is_policy_arn_present = var.policy_arn != null && var.policy_arn != ""
}

resource "aws_iam_policy" "this" {
  count       = local.is_policy_arn_present ? 0 : 1
  name        = var.policy.name
  path        = "/"
  description = var.policy.description

  policy = jsonencode(var.policy.body)
}