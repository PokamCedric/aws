The ZIP file is sent by Terraform to an S3 bucket where the website is hosted.

Once the ZIP file is in the S3 bucket it has to be extracted in-place and any changed files replaced with new ones.

This is where the Lambda function comes in.