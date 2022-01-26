terraform {
  required_version = "=0.14.11"

  backend "local" {
    path = "../state/14.x/terraform.tfstate"
  }
}

variable version_import {
  type = string
  default = "14.x"
}

data "terraform_remote_state" "create_remote_state" {
  backend = "local"

  config = {
    path = "../../create_remote_state/state/${var.version_import}/terraform.tfstate"
  }
}

variable out_path {
  type = string
  default = "../files/14.x/rendered_myfile1.txt"
}

resource "local_file" "file" {
    content     = templatefile(data.terraform_remote_state.create_remote_state.outputs.filepath, { template_variable = "Imported into 14.x"})
    filename = var.out_path
}

output filepath {
  value = var.out_path
}
