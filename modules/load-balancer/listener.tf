
################################################################################
# Forward Action 
################################################################################

# ALB FA-Listener
resource "aws_lb_listener" "alb_fa_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  count             = var.alb_fa_listener_count
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

# NLB FA-Listener
resource "aws_lb_listener" "nlb_fa_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  count             = var.nlb_fa_listener_count
  port              = 443
  protocol          = "TLS"
  certificate_arn   = var.certificate_arn
  alpn_policy       = "HTTP2Preferred"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

# GLB FA-Listener
resource "aws_lb_listener" "glb_fa_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  count             = var.glb_fa_listener_count

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

################################################################################
# Redirect Action 
################################################################################

resource "aws_lb_listener" "ra_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  count             = var.ra_listener_count
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      host        = "#{host}"
      path        = "/#{path}"
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


