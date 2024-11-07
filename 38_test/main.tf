
terraform {
  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

variable "services" {
  type = map(object({
    node = string
    kind = string
  }))
  description = "List of services and their metadata"
}

variable "service_kind" {
  type        = string
  description = "Service kind to search"

  validation {
    condition = can(regex("^(tcp|http)$", var.service_kind))
    error_message = "Service kind must be either 'tcp' or 'http'"
  }
}

locals {
  ip_addresses = toset([
    for service, service_data in var.services :
    replace(replace(split(".", service_data.node)[0], "ip-", ""), "-", ".") if service_data.kind == var.service_kind
  ])
}

resource "local_file" "ip_addresses" {
  content  = jsonencode(local.ip_addresses)
  filename = "./out/${var.service_kind}.hcl"
}

check "file" {
  assert {
    condition = local_file.ip_addresses.filename == "./out/${var.service_kind}.hcl"
    error_message = "File name is not correct"
  }
} 