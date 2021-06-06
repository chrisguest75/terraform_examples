terraform {
  required_version = "=0.15.05"

  backend "local" {
    path = "./state/terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "aws"
      version = "3.44.0"
    }
  }
}

provider "aws" {
    region = "eu-west-1"
    default_tags { 
        tags = {
            "repo" = "my example repo",
            "owner" = "chris guest",
            "managedby" = "terraform"
        }
    }
}

variable "account_id" {
    type = string
    default = "699610193124"
}

resource "aws_apprunner_service" "example" {
  service_name = "example"

  source_configuration {
    auto_deployments_enabled = false
    image_repository {
      image_configuration {
        port = "80"
      }
      image_identifier      = "public.ecr.aws/ubuntu/nginx:latest"
      image_repository_type = "ECR_PUBLIC"

      #image_identifier      = "${var.account_id}.dkr.ecr.eu-west-1.amazonaws.com/apprunner-test:nginx-1-20-1"
      #image_repository_type = "ECR"
    }
  }

  tags = {
    Name = "example-apprunner-service"
  }
}