resource "aws_s3_object" "this" {
  bucket = var.bucket
  key    = var.file_destination_path
  source = var.file_source_path

  etag = filemd5(var.file_source_path)
}