locals {
  api_gateway_rest_api = "${aws_api_gateway_rest_api.visitorCounter.execution_arn}/*"
  rest_api_id          = aws_api_gateway_rest_api.visitorCounter.id
  resource_id          = aws_api_gateway_resource.cors_resource.id
  http_method          = aws_api_gateway_method.increment_visitors_method.http_method
  http_method_option   = aws_api_gateway_method.options_method.http_method
}

resource "aws_api_gateway_rest_api" "visitorCounter" {
  name        = "visitorCounter"
  description = "Visitor Counter API"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "cors_resource" {
  path_part   = var.resource
  parent_id   = aws_api_gateway_rest_api.visitorCounter.root_resource_id
  rest_api_id = local.rest_api_id
}

resource "aws_api_gateway_method" "increment_visitors_method" {
  rest_api_id   = local.rest_api_id
  resource_id   = local.resource_id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "method_response_200" {
  depends_on = [aws_api_gateway_method.increment_visitors_method]

  rest_api_id = local.rest_api_id
  resource_id = local.resource_id
  http_method = local.http_method
  status_code = "200"
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }
}

resource "aws_api_gateway_integration" "lambda_visitor_integration" {
  rest_api_id             = local.rest_api_id
  resource_id             = local.resource_id
  http_method             = local.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = module.lambda.invoke_arn
}

resource "aws_api_gateway_integration_response" "VisitorIntegrationResponse" {
  depends_on = [aws_api_gateway_integration.lambda_visitor_integration]

  rest_api_id = local.rest_api_id
  resource_id = local.resource_id
  http_method = local.http_method
  status_code = aws_api_gateway_method_response.method_response_200.status_code
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

resource "aws_api_gateway_deployment" "visitor_api_deployment" {
  depends_on = [aws_api_gateway_integration.lambda_visitor_integration]

  rest_api_id = local.rest_api_id
  stage_name  = var.stage_name

  triggers = {
    "redeployment" = sha1(jsonencode([
      aws_api_gateway_resource.cors_resource.id,
      aws_api_gateway_method.increment_visitors_method.http_method,
      aws_api_gateway_integration.lambda_visitor_integration.id,
      aws_api_gateway_method_response.method_response_200.id
    ]))
  }
}

# OPTIONS HTTP method.
resource "aws_api_gateway_method" "options_method" {
  rest_api_id   = local.rest_api_id
  resource_id   = local.resource_id
  http_method   = "OPTIONS"
  authorization = "NONE"
}

# OPTIONS method response.
resource "aws_api_gateway_method_response" "options_200" {
  depends_on = [aws_api_gateway_method.options_method]

  rest_api_id = local.rest_api_id
  resource_id = local.resource_id
  http_method = local.http_method_option
  status_code = 200
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin"  = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Headers" = true
  }
  response_models = {
    "application/json" = "Empty"
  }
}

# OPTIONS integration.
resource "aws_api_gateway_integration" "options_integration" {
  depends_on = [aws_api_gateway_method.options_method]

  rest_api_id = local.rest_api_id
  resource_id = local.resource_id
  http_method = local.http_method_option
  type        = "MOCK"
  request_templates = {
    "application/json" = jsonencode(
      {
        statusCode = 200
      }
    )
  }
}

# OPTIONS integration response.
resource "aws_api_gateway_integration_response" "options_integration_response" {
  depends_on = [aws_api_gateway_method_response.options_200]

  rest_api_id = local.rest_api_id
  resource_id = local.resource_id
  http_method = local.http_method_option
  status_code = aws_api_gateway_method_response.options_200.status_code
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'OPTIONS,POST'",
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }
}

output "url" {
  value = "${aws_api_gateway_deployment.visitor_api_deployment.invoke_url}/${var.resource}"
}
