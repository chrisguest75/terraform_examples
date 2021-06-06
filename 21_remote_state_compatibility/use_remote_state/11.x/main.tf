terraform {
  required_version = "=0.11.15"

  backend "local" {
    path = "../state/11.x/terraform.tfstate"
  }
}

variable version_import {
  type = "string"
  default = "11.x"
}

data "terraform_remote_state" "create_remote_state" {
  backend = "local"

  config = {
    path = "${path.module}/../create_remote_state/state/${var.version_import}/terraform.tfstate"
  }
}

variable out_path {
  type = "string"
  default = "../files/11.x/rendered_myfile1.txt"
}

resource "local_file" "file" {
    content     = templatefile("${data.terraform_remote_state.create_remote_state.outputs.filepath}", { template_variable = "replace the variable"})
    filename = "${var.out_path}"
}

output filepath {
  value = "${var.out_path}"
}
