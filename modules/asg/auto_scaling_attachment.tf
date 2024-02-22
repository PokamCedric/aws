# attach auto scaling group to alb target group
resource "aws_autoscaling_attachment" "this" {
  count                  = var.lb_target_group.enabled ? 1 : 0
  autoscaling_group_name = aws_autoscaling_group.this.id
  lb_target_group_arn    = var.lb_target_group.arn
}
