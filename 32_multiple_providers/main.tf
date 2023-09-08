locals {
  bucket_name = "cg-provider-test-bucket"
}

module "website_bucket_east" {
  source = "./website_bucket"
  providers = {
    aws = aws.useast1
  }

  bucket_name = format("%s-%s", local.bucket_name, "useast1")
}

module "website_bucket_west" {
  source = "./website_bucket"
  providers = {
    aws = aws.uswest1
  }

  bucket_name = format("%s-%s", local.bucket_name, "uswest1")
}

output "s3_east_url" {
  value       = "${module.website_bucket_east.s3_url}"
  description = "The url of the east s3 bucket"
}
output "s3_west_url" {
  value       = "${module.website_bucket_west.s3_url}"
  description = "The url of the west s3 bucket"
}