resource "aws_iam_role" "this" {
  name = var.role.name

  assume_role_policy = jsonencode(var.role.body)
}