terraform {
  required_version = "=0.15.5"

  backend "local" {
    path = "../state/15.x/terraform.tfstate"
  }
}

variable out_path {
  type = string
  default = "../../files/15.x/myfile1.txt"
}

resource "local_file" "myfile" {
  content  = "This is my file1 $${template_variable}"
  filename = var.out_path
}

output filepath {
  value = var.out_path
}

