resource "aws_iam_instance_profile" "this" {
  name = var.instance_profile
  role = aws_iam_role.this.name
}