terraform {
  required_version = "~>1.3.2"

  required_providers {
    honeycombio = {
      source = "honeycombio/honeycombio"
      version = "0.13.1"
    }

    aws = {
      source = "hashicorp/aws"
      # version = "~>4"
      # version = "4.60.0"
      version = "4.56.0"
    }    
  
    local = {
      source = "hashicorp/local"
      version = "~>2"
    }  
  }

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "honeycombio" {
}

provider "local" {
}

#################################################
## Variables
#################################################

variable out_path {
  type = string
  default = "./files"
}

variable out_filename {
  type = string
  default = "myfile.txt"
}

#################################################
## Locals
#################################################

locals {
  filepath = "${var.out_path}/${var.out_filename}"
}

#################################################
## Resources
#################################################

resource "local_file" "file" {
    content     = "This is a file"
    filename = local.filepath
}

