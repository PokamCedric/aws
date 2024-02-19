resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = var.subnet_ids
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "asg-server"
    propagate_at_launch = true
  }

}