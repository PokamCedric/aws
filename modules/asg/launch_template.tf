resource "aws_launch_template" "launch_template" {
  name                   = "launch-template"
  description            = "launch-template for asg"
  image_id               = var.ami_id
  instance_type          = "t2.micro"
  user_data              = base64encode(file("${var.user_data_path}"))

  network_interfaces {
    associate_public_ip_address = true
    security_groups = var.sg_ids
  }

}