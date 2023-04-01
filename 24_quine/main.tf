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
  main_file = file("./main.tf")
  version_file = file("./.terraform-version")
  tfvars_file = file("./terraform.tfvars")
  readme_file = file("./README.md")
  ignore_file = file("./.gitignore")
}

#################################################
## Resources
#################################################

resource "local_file" "mainfile" {
  content  = local.main_file
  filename = "${var.output_path}/main.tf"
}

resource "local_file" "versionfile" {
  content  = local.version_file
  filename = "${var.output_path}/.terraform-version"
}

resource "local_file" "tfvarsfile" {
  content  = local.tfvars_file
  filename = "${var.output_path}/terraform.tfvars"
}

resource "local_file" "readmefile" {
  content  = local.tfvars_file
  filename = "${var.output_path}/README.md"
}

resource "local_file" "ignorefile" {
  content  = local.tfvars_file
  filename = "${var.output_path}/.gitignore"
}
