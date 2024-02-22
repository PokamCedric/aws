resource "aws_autoscaling_group" "this" {
  name                = var.as_name
  vpc_zone_identifier = var.subnet_ids
  desired_capacity    = var.capacity.desired_capacity
  max_size            = var.capacity.max_size
  min_size            = var.capacity.min_size
  health_check_type   = var.health_check_type

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = var.tag.key
    value               = var.tag.value
    propagate_at_launch = var.tag.propagate_at_launch
  }

  lifecycle {
    ignore_changes = [target_group_arns]
  }
}