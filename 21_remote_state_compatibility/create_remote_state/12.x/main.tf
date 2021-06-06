terraform {
  required_version = "=0.12.31"

  backend "local" {
    path = "../state/12.x/terraform.tfstate"
  }
}

variable out_path {
  type = string
  default = "../../files/12.x/myfile1.txt"
}

resource "local_file" "myfile" {
  content  = "Created using 12.x $${template_variable}"
  filename = var.out_path
}

output filepath {
  value = var.out_path
}

