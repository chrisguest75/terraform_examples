terraform {
  required_version = "=1.3.2"

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

#################################################
## Variables
#################################################

variable "output_path" {
  type = string
  default = "./output"

  # validation {
  #   condition = fileexists(var.output_path)
  #   error_message = "Output path does not exist."
  # }
}

#################################################
## Locals
#################################################

locals {
  contents = toset(["./main.tf", "./.terraform-version", "./terraform.tfvars", "./README.md", "./.gitignore"])
}

#################################################
## Resources
#################################################

resource "local_file" "files" {
  for_each = local.contents
  content  = file(each.value)
  filename = join("/", [var.output_path, basename(each.value)])
}
