resource "aws_lb_target_group_attachment" "this" {
  # convert a list of instance objects to a map with instance ID as the key, and an instance
  # object as the value.
  for_each = {
    for k, v in var.target_instances :
    v.id => v
  }

  target_group_arn = aws_lb_target_group.this.arn
  target_id        = each.value.id
  port             = each.value.port
}