
module "object" {
  source = "../modules/s3/object"

  bucket                = module.s3_bucket_source.id
  file_source_path      = var.file_source_path
  file_destination_path = "Initio.zip"
}
