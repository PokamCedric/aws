variable "role" {
  default = {
    name        = "fleetcart_web_role"
    description = null
    body = {
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Sid    = ""
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        }
      ]
    }
  }
  description = "iam role"
  type = object({
    name        = string
    description = string
    body        = any
  })
}

variable "policy" {
  default = {
    name        = "fleetcart_web_bucket_policy"
    description = "Allow"
    body = {
      Version : "2012-10-17",
      Statement : [
        {
          Effect : "Allow",
          Action : [
            "s3:PutObject",
            "s3:GetObject",
            "s3:ListBucket",
            "s3:DeleteObject"
          ],
          Resource : [
            "arn:aws:s3:::*/*",
            "arn:aws:s3:::mydemoacloudgurus3bucket",
            "arn:aws:s3:::cedricpokam-fleetcart-bucket"
          ]
        }
      ]
    }
  }
  description = "iam policy"
  type = object({
    name        = string
    description = string
    body        = any
  })
}