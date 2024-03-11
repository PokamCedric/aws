module "s3-unzip" {
  source = "../modules/s3/unzip"

  dest_key      = "/$filename.$extension"
  src_bucket    = module.s3_bucket_source.id
  delete_source = true
}