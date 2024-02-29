locals {
  is_cluster_name_present = var.cluster_name != null && var.cluster_name != ""
  ecs_cluster_name        = local.is_cluster_name_present ? var.cluster_name : "${var.project_name}-${var.environment}-service"
}

resource "aws_ecs_cluster" "this" {
  name = local.ecs_cluster_name

  # disable insights monitoring to prevent more costs
  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}