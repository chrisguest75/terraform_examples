terraform {
  required_version = "~>1.3.2"

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

#################################################
## Variables
#################################################

variable "out_path" {
  type    = string
  default = "./files"
}

variable "out_filename" {
  type    = string
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
  content  = "This is a file"
  filename = local.filepath
}

