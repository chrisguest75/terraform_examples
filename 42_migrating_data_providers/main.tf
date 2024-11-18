terraform {
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
  content  = data.cloudinit_config.userdata.rendered
  filename = local.filepath
}






