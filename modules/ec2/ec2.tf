
resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  iam_instance_profile   = var.iam_instance_profile
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids
  user_data              = var.user_data_path == null ? null : templatefile(var.user_data_path, {})
  subnet_id              = var.subnet_id
  root_block_device {
    volume_size = var.volume_size
  }

  tags = var.tags

}