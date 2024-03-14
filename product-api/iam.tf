locals {
  # Service to apply role
  service = "lambda"
}

data "template_file" "lambda_policy" {
  template = file("${path.module}/policy.json")
}

module "lambda_policy" {
  source = "../modules/iam"

  role = {
    name        = "${local.service}-role"
    description = null
    body        = <<EOF
{
        "Version": "2012-10-17",
        "Statement": [
            {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service" : "${local.service}.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
            }
        ]
}
EOF
  }
  policy = {
    name        = "${local.service}-policy"
    description = "IAM policy for Product lambda functions"
    body        = data.template_file.lambda_policy.rendered
  }
}
