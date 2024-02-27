# Create target group
resource "aws_lb_target_group" "this" {
  name        = var.tg_name
  target_type = var.tg_type
  port        = var.tg_port.id
  protocol    = var.tg_port.protocol
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = var.healthy_threshold
    interval            = var.interval
    matcher             = var.matcher
    path                = var.path
    port                = var.hc_port.id
    protocol            = var.hc_port.protocol
    timeout             = var.timeout
    unhealthy_threshold = var.unhealthy_threshold
  }
}
