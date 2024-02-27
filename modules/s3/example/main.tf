module "s3" {
  source = "../"

  environment = "Dev"

  bucket_name = "cedricpokam-fleetcart-bucket"
  bucket_tags = {
    Name = "fleetcart-bucket"
  }

  file_source_path      = "C:\\Users\\molar\\Downloads\\FleetCart.zip"
  file_destination_path = "FleetCart.zip"
}
