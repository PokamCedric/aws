locals {
  is_name_present = var.name != null && var.name != ""
  sqs_name        = local.is_name_present ? var.name : "${var.project_name}-${var.environment}-sqs"
}


resource "aws_sqs_queue" "this" {
  name = local.sqs_name
}