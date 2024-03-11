##### will upload all the files present under HTML folder to the S3 bucket #####
resource "aws_s3_object" "upload_object" {
  for_each      = fileset(var.file_source_path, "*")
  bucket        = var.bucket
  key           = each.value
  source        = "${var.file_source_path}/${each.value}"
  etag          = filemd5("${var.file_source_path}/${each.value}")
  content_type  = "text/html"
}