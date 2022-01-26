terraform {
  required_version = "=0.13.7"

  backend "local" {
    path = "../state/13.x/terraform.tfstate"
  }
}

variable out_path {
  type = string
  default = "../../files/13.x/myfile1.txt"
}

resource "local_file" "myfile" {
  content  = "Created using 13.x $${template_variable}"
  filename = var.out_path
}

output filepath {
  value = var.out_path
}

