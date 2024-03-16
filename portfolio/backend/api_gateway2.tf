# locals {
#   api_gateway_rest_api = "${module.aws_api_gateway.rest_api_execution_arn}/*"
#   rest_api_id  = module.aws_api_gateway.rest_api_id
#   resource_id  = module.aws_api_gateway.resource_id
#   http_method  = aws_api_gateway_method.options_method.http_method
# }

# module "aws_api_gateway" {
#   source = "../../modules/api_gateway/advanced/"

#   resource        = var.resource
#   api_description = "Visitor Counter API"
#   method          = "POST"
#   stage_name      = "dev"
#   inegration_uri  = module.lambda.invoke_arn
#   #  type        = "AWS_PROXY"

# }

# output "url" {
#   value = "${module.aws_api_gateway.deployment_invoke_url}/${var.resource}"
# }

# # OPTIONS HTTP method.
# resource "aws_api_gateway_method" "options_method" {
#   rest_api_id= local.rest_api_id
#   resource_id = local.resource_id
#   http_method   = "OPTIONS"
#   authorization = "NONE"
# }

# # OPTIONS method response.
# resource "aws_api_gateway_method_response" "options_200" {
#   depends_on = [aws_api_gateway_method.options_method]

#   rest_api_id= local.rest_api_id
#   resource_id = local.resource_id
#   http_method = local.http_method_option
#   status_code = 200
#   response_parameters = {
#     "method.response.header.Access-Control-Allow-Origin"  = true,
#     "method.response.header.Access-Control-Allow-Methods" = true,
#     "method.response.header.Access-Control-Allow-Headers" = true
#   }
#   response_models = {
#     "application/json" = "Empty"
#   }
# }

# # OPTIONS integration.
# resource "aws_api_gateway_integration" "options_integration" {
#   depends_on = [aws_api_gateway_method.options_method]

#   rest_api_id= local.rest_api_id
#   resource_id = local.resource_id
#   http_method = local.http_method_option
#   type        = "MOCK"
#   request_templates = {
#     "application/json" = jsonencode(
#       {
#         statusCode = 200
#       }
#     )
#   }
# }

# # OPTIONS integration response.
# resource "aws_api_gateway_integration_response" "options_integration_response" {
#   depends_on = [aws_api_gateway_method_response.options_200]

#   rest_api_id= local.rest_api_id
#   resource_id = local.resource_id
#   http_method = local.http_method_option
#   status_code = aws_api_gateway_method_response.options_200.status_code
#   response_parameters = {
#     "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
#     "method.response.header.Access-Control-Allow-Methods" = "'OPTIONS,POST'",
#     "method.response.header.Access-Control-Allow-Origin"  = "'*'"
#   }
# }