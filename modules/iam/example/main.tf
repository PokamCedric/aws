module "iam_bucket_role_policy" {
  source = "../"

  role = {
    name        = "fleetcart_role"
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
        },
      ]
    }
  }

  policy = {
    name        = "fleetcart_bucket_policy"
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
            "arn:aws:s3:::${var.bucket_name}"
          ]
        }
      ]
    }
  }

}
