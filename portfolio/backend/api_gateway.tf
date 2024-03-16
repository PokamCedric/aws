module "aws_api_gateway" {
  source = "../../modules/api_gateway/advanced/"

  resource        = var.resource
  api_description = "Visitor Counter API"
  method         = "POST"
  stage_name      = "dev"
  inegration_uri  = module.lambda.invoke_arn
  #  type        = "AWS_PROXY"

}

output "url" {
  value = "${module.aws_api_gateway.deployment_invoke_url}/${var.resource}"
}

# resource "aws_api_gateway_api_key" "visitor_api_key" {
#   name        = "incrementVisitorCount-Key"
#   description = "Visitor Counter Api Key"
#   enabled     = false
# }

# resource "aws_api_gateway_usage_plan_key" "main" {
#   key_id        = aws_api_gateway_api_key.visitor_api_key.id
#   key_type      = "API_KEY"
#   usage_plan_id = aws_api_gateway_usage_plan.incrementVisitor-UsagePlan.id
# }


# # OPTIONS HTTP method.
# resource "aws_api_gateway_method" "options_method" {
#   rest_api_id   = aws_api_gateway_rest_api.visitorCounter.id
#   resource_id   = aws_api_gateway_resource.cors_resource.id
#   http_method   = "OPTIONS"
#   authorization = "NONE"
# }

# # OPTIONS method response.
# resource "aws_api_gateway_method_response" "options_200" {
#   rest_api_id = aws_api_gateway_rest_api.visitorCounter.id
#   resource_id = aws_api_gateway_resource.cors_resource.id
#   http_method = aws_api_gateway_method.options_method.http_method
#   status_code = 200
#   response_parameters = {
#     "method.response.header.Access-Control-Allow-Origin"  = true,
#     "method.response.header.Access-Control-Allow-Methods" = true,
#     "method.response.header.Access-Control-Allow-Headers" = true
#   }
#   response_models = {
#     "application/json" = "Empty"
#   }

#   depends_on = [aws_api_gateway_method.options_method]
# }

# # OPTIONS integration.
# resource "aws_api_gateway_integration" "options_integration" {
#   rest_api_id = aws_api_gateway_rest_api.visitorCounter.id
#   resource_id = aws_api_gateway_resource.cors_resource.id
#   http_method = aws_api_gateway_method.options_method.http_method
#   type        = "MOCK"
#   request_templates = {
#     "application/json" = jsonencode(
#       {
#         statusCode = 200

#         depends_on = [aws_api_gateway_method.options_method]
#       }
#     )
#   }
# }

# # OPTIONS integration response.
# resource "aws_api_gateway_integration_response" "options_integration_response" {
#   rest_api_id = aws_api_gateway_rest_api.visitorCounter.id
#   resource_id = aws_api_gateway_resource.cors_resource.id
#   http_method = aws_api_gateway_method.options_method.http_method
#   status_code = aws_api_gateway_method_response.options_200.status_code
#   response_parameters = {
#     "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
#     "method.response.header.Access-Control-Allow-Methods" = "'OPTIONS,POST'",
#     "method.response.header.Access-Control-Allow-Origin"  = "'*'"
#   }
#   depends_on = [aws_api_gateway_method_response.options_200]
# }