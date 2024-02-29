resource "aws_iam_policy" "this" {
  count       = var.policy_arn != null || var.policy_arn != "" ? 0 : 1
  name        = var.policy.name
  path        = "/"
  description = var.policy.description

  policy = jsonencode(var.policy.body)
}