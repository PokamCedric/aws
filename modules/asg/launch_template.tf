resource "aws_launch_template" "this" {
  name          = var.lt_name
  description   = var.lt_description
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data_path == null ? "" : base64encode(file("${var.user_data_path}"))

  network_interfaces {
    associate_public_ip_address = var.network.associate_public_ip_address
    security_groups             = var.network.security_group_ids
  }

  monitoring {
    enabled = var.monitoring_enabled
  }
}