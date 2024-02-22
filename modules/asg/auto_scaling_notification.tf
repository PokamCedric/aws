# create an auto scaling group notification
resource "aws_autoscaling_notification" "this" {
  count       = var.topic.enabled ? 1 : 0
  group_names = [aws_autoscaling_group.this.name]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = var.topic.arn
}