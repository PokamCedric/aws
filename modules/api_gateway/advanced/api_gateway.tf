resource "aws_api_gateway_rest_api" "this" {
  name        = "${var.resource}-apigw"
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

  http_method = var.method
}

resource "aws_api_gateway_method_response" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.this.id
  http_method = aws_api_gateway_method.this.http_method
  status_code = "200"
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }
  depends_on = [ aws_api_gateway_method.this ]
}

resource "aws_api_gateway_integration" "this" {

  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.this.id
  type        = "AWS_PROXY"
  uri         = var.inegration_uri

  http_method             = aws_api_gateway_method.this.http_method
  integration_http_method = var.method
}

resource "aws_api_gateway_integration_response" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.this.id
  http_method = aws_api_gateway_method.this.http_method
  status_code = aws_api_gateway_method_response.this.status_code
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  depends_on = [ aws_api_gateway_integration.this ]
}

resource "aws_api_gateway_deployment" "this" {
  depends_on = [ aws_api_gateway_integration.this ]

  rest_api_id = aws_api_gateway_rest_api.this.id
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
