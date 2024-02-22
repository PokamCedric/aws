# create application load balancer
# terraform aws create application load balancer
resource "aws_lb" "load_balancer" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = var.lb_type
  security_groups    = var.security_group_ids

  dynamic "subnet_mapping" {

      # for_each = toset(var.subnet_ids)
      for_each = { for s in var.subnet_ids: index(var.subnet_ids, s) => s }

      content {
         subnet_id     = each.value
      }
  }

  enable_deletion_protection = var.deletion_protection

  tags   = var.lb_tags
}
