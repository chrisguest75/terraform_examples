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
  validation {
    condition     = can(regex("^(.+)\\/([^\\/]+)$", var.ssm_version_path))
    error_message = "ssm_version_path is not a valid SSM Parameter Store path"
  }
}

data "aws_ssm_parameter" "version" {
  name = var.ssm_version_path
}

variable "ssm_encrypted_path" {
  type    = string
  default = "/terraform/21_importing_ssm/encrypted"

  validation {
    condition     = can(regex("^(.+)\\/([^\\/]+)$", var.ssm_encrypted_path))
    error_message = "ssm_encrypted_path is not a valid SSM Parameter Store path"
  }
}

data "aws_ssm_parameter" "encrypted" {
  name = var.ssm_encrypted_path
  with_decryption = true
}

data "aws_ssm_parameter" "notdecrypted" {
  name = var.ssm_encrypted_path
  with_decryption = false
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

  content  = <<-EOT
  SSM Parameter Store Values:
  ${data.aws_ssm_parameter.version.name}
  ${data.aws_ssm_parameter.version.value}

  ${data.aws_ssm_parameter.encrypted.name}
  ${data.aws_ssm_parameter.encrypted.value}

  ${data.aws_ssm_parameter.notdecrypted.name}
  ${data.aws_ssm_parameter.notdecrypted.value}
  EOT
  
  
  
  filename = "./files/version.txt"
}
