module "s3" {
  source = "../"

  environment  = "Dev"
  project_name = "example"

  bucket_name = "cedricpokam-techmax-bucket-2"
  bucket_tags = {
    Name = "techmax-bucket"
  }

  file_source_path      = var.file_source_path
  file_destination_path = "techmax.zip"
}
