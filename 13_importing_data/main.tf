terraform {
  required_version = "=0.15.05"

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

variable records_file {
  type = string
  default = "./dns/test_records.json"
  # validation {
  #   condition     = fileexists(var.records_file)
  #   error_message = "Input filepath does not exist"
  # }
}

variable out_file {
  type = string
  default = "./files/dns_records_out.json"
}

locals {
  # Load all of the data from json
  all_json_data = jsondecode(file(var.records_file))

  # Load the first map indirectly
  records_data = local.all_json_data.records
}

resource "local_file" "file" {
    content     = "This is my file $${template_variable}"
    filename = var.out_file
}

output records_data {
  value = local.records_data
}