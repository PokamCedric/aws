resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.this.bucket
  key    = var.file_destination_path
  source = var.file_source_path

  etag = filemd5(var.file_source_path)
}