terraform {
  required_version = "=1.4.0"

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

#################################################
## Variables
#################################################

variable "ssm_version_path" {
  type    = string
  default = "/terraform/21_importing_ssm/version"
  # validation {
  #   condition     = fileexists(var.records_file)
  #   error_message = "Input filepath does not exist"
  # }
}

data "aws_ssm_parameter" "version" {
  name = var.ssm_version_path
}

#################################################
## Locals
#################################################

locals {
}

#################################################
## Resources
#################################################

resource "local_file" "file" {
  content  = data.aws_ssm_parameter.version.value
  filename = "./files/version.txt"
}
