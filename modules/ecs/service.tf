locals {
  is_service_name_present = var.service_name != null && var.service_name != ""
  ecs_service_name        = local.is_service_name_present ? var.service_name : "${var.project_name}-${var.environment}-service"

  is_container_name_present = var.container_name != null && var.container_name != ""
  container_name            = local.is_container_name_present ? var.container_name : var.project_name
}

resource "aws_ecs_service" "this" {
  name                               = local.ecs_service_name
  cluster                            = aws_ecs_cluster.this.id
  task_definition                    = aws_ecs_task_definition.this.arn
  desired_count                      = var.desired_count
  deployment_minimum_healthy_percent = var.deployment.min
  deployment_maximum_percent         = var.deployment.max
  launch_type                        = var.launch_type
  scheduling_strategy                = var.scheduling_strategy

  network_configuration {
    security_groups  = var.security_groups
    subnets          = var.subnet_ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = local.container_name
    container_port   = var.container_port_mapping.containerPort
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}