locals {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.this.id
  http_method = aws_api_gateway_method.this.http_method
}

resource "aws_api_gateway_rest_api" "this" {
  name        = "${var.resource}-apigw"
  description = var.api_description
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "this" {
  path_part   = var.resource
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  rest_api_id = local.rest_api_id
}

resource "aws_api_gateway_method" "this" {
  rest_api_id   = local.rest_api_id
  resource_id   = local.resource_id
  http_method   = var.method
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "this" {
  depends_on = [aws_api_gateway_method.this]

  rest_api_id = local.rest_api_id
  resource_id = local.resource_id
  http_method = local.http_method
  status_code = "200"
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }
}

resource "aws_api_gateway_integration" "this" {
  rest_api_id             = local.rest_api_id
  resource_id             = local.resource_id
  http_method             = local.http_method
  integration_http_method = var.method
  type                    = "AWS"
  uri                     = var.inegration_uri
}

resource "aws_api_gateway_integration_response" "this" {
  depends_on = [aws_api_gateway_integration.this]

  rest_api_id = local.rest_api_id
  resource_id = local.resource_id
  http_method = local.http_method
  status_code = aws_api_gateway_method_response.this.status_code
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

resource "aws_api_gateway_deployment" "this" {
  depends_on = [aws_api_gateway_integration.this]

  rest_api_id = local.rest_api_id
  stage_name  = var.stage_name

  triggers = {
    "redeployment" = sha1(jsonencode([
      aws_api_gateway_resource.this.id,
      aws_api_gateway_method.this.http_method,
      aws_api_gateway_integration.this.id,
      aws_api_gateway_method_response.this.id
    ]))
  }
}
