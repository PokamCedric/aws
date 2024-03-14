locals {
  is_instance_profile = var.instance_profile != null && var.instance_profile != ""
}

resource "aws_iam_instance_profile" "this" {
  count = local.is_instance_profile ? 0 : 1

  name = var.instance_profile
  role = aws_iam_role.this.name
}