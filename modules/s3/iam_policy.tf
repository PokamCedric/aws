resource "aws_iam_policy" "this" {
  name        = var.iam_policy_name
  path        = "/"
  description = "Allow "

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ],
        "Resource" : [
          "arn:aws:s3:::*/*",
          "arn:aws:s3:::${var.bucket_name}"
        ]
      }
    ]
  })
}