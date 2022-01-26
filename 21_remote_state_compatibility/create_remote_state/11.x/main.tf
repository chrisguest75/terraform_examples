terraform {
  required_version = "=0.11.15"

  backend "local" {
    path = "../state/11.x/terraform.tfstate"
  }
}

variable out_path {
  type = "string"
  default = "../../files/11.x/myfile1.txt"
}

resource "local_file" "myfile" {
  content  = "Created using 11.x $${template_variable}"
  filename = "${var.out_path}"
}

output filepath {
  value = "${var.out_path}"
}

