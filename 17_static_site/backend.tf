terraform {
  required_version = "=1.4.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }

  backend "s3" {
    bucket         = ""
    key            = "toys/eu-west-1/static-site-test.tfstate"
    region         = ""
    dynamodb_table = ""
  }
}
