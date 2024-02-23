resource "aws_iam_policy" "this" {
  name        = var.policy.name
  path        = "/"
  description = var.policy.description

  policy = jsonencode(var.policy.body)
}