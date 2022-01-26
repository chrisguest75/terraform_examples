terraform {
  required_version = "=1.0.11"

  backend "s3" {
    bucket         = ""
    key            = "toys/eu-west-1/static-site-test.tfstate"
    region         = ""
    dynamodb_table = ""
  }
}