resource "aws_api_gateway_rest_api" "this" {
  name        = "${var.resource}_apigw"
  description = var.api_description
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = var.resource
}

resource "aws_api_gateway_method" "this" {

  rest_api_id      = aws_api_gateway_rest_api.this.id
  resource_id      = aws_api_gateway_resource.this.id
  authorization    = "NONE"
  api_key_required = false # to avoid execption : Missing Authentication Token

  count       = length(var.methods)
  http_method = var.methods[count.index]
}

resource "aws_api_gateway_integration" "this" {

  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.this.id
  type        = "AWS_PROXY"
  uri         = var.inegration_uri

  count                   = length(var.methods)
  http_method             = aws_api_gateway_method.this[count.index].http_method
  integration_http_method = var.methods[count.index]
}

resource "aws_api_gateway_deployment" "this" {
  depends_on = [aws_api_gateway_integration.this]

  rest_api_id = aws_api_gateway_rest_api.this.id
  stage_name  = var.stage_name
}