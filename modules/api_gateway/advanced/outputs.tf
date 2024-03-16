output "rest_api_id" {
  description = "REST API id"
  value       = aws_api_gateway_rest_api.this.id
}

output "resource_id" {
  description = "API resource id"
  value       = aws_api_gateway_resource.this.id
}

output "rest_api_execution_arn" {
  description = "REST API execution ARN"
  value       = aws_api_gateway_rest_api.this.execution_arn
}

output "deployment_id" {
  description = "Deployment id"
  value       = aws_api_gateway_deployment.this.id
}

output "deployment_invoke_url" {
  description = "Deployment invoke url"
  value       = aws_api_gateway_deployment.this.invoke_url
}

output "deployment_execution_arn" {
  description = "Deployment execution ARN"
  value       = aws_api_gateway_deployment.this.execution_arn
}

output "name" {
  description = "API Gateway name"
  value       = aws_api_gateway_rest_api.this.name
}