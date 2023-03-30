terraform {
  required_version = "=1.2.1"

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

#################################################
## Variables
#################################################

variable "files" {
  type    = string
  default = "./files.json"
}

variable "out_path" {
  type    = string
  default = "./files"
}

#################################################
## Locals
#################################################

locals {
  json_files = jsondecode(file(var.files))
  files_list = local.json_files.files
}

#################################################
## Resources
#################################################

resource "local_file" "file" {
  for_each = { for file in local.files_list : format("%s", file.name) => file }
  content  = format("hello")
  filename = format("%s/%s", var.out_path, each.value.name)
}

output "records_data" {
  value = local.files_list
}

#################################################
## Debugging
#################################################

resource "null_resource" "debugging" {
  provisioner "local-exec" {
    command = "echo ${join(",", local.files_list[*].name)} >> ./newfiles/list.txt"
  }

}
