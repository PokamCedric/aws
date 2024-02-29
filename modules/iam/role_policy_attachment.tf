resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = local.is_policy_arn_present ? var.policy_arn : aws_iam_policy.this[0].arn
}