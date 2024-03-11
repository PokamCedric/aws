locals {
  file_source_path = "../../webfiles/portfolio/initio"
}

module "upload_object" {
  source = "../modules/s3/folder_object"

  bucket           = module.s3_bucket_source.id
  file_source_path = local.file_source_path
}
