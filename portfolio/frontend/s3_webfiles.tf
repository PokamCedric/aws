locals {
  file_source_path = "../../webfiles/git/portfolio/webfiles"
}

# cli command
# aws s3 cp ../../deliveries/ s3://portfolio-dev-bucket-251005264036 --recursive

module "upload_object" {
  source = "../../modules/s3/folder_object"

  bucket           = module.s3_bucket_source.id
  file_source_path = local.file_source_path
}
