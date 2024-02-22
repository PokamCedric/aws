# Create load balancer
resource "aws_lb" "load_balancer" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = var.lb_type
  security_groups    = var.security_group_ids

  dynamic "subnet_mapping" {

    for_each = toset(var.subnet_ids)
    content {
      subnet_id = subnet_mapping.value
    }
  }

  enable_deletion_protection = var.deletion_protection

  tags = var.lb_tags
}

