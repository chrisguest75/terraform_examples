
terraform {
  required_version = ">=1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
  alias = "useast1"

  default_tags {
    tags = var.tags
  }
}

provider "aws" {
  region = "us-west-1"
  alias = "uswest1"

  default_tags {
    tags = var.tags
  }
}