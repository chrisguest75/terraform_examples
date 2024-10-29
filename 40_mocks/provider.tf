provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      "created_by"  = "terraform"
      "application" = "mocking-test"
      "owner"       = "chrisguest"
    }
  }
}