terraform {
  backend "s3" {
    bucket = "my-terraform-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
    endpoints = {
      s3 = "https://ams3.digitaloceanspaces.com"
    }
    access_key = ""
    secret_key = ""
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id = true
    skip_region_validation = true
    skip_s3_checksum = true
  }
}