terraform {
  required_version = "=1.12.2"

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

terraform {
  required_providers {
    time = {
      source = "hashicorp/time"
      version = "0.13.1"
    }
  }
}

#################################################
## Variables
#################################################

variable "output_path" {
  type    = string
  default = "./output"

  validation {
    condition     = startswith(var.output_path, "./") && (length(var.output_path) > 2)
    error_message = "Path has to start with './' and be longer than 2 characters."
  }
}

#################################################
## Locals
#################################################

locals {
  current_time = timestamp()
  hour = provider::time::rfc3339_parse(local.current_time).hour
  capacity_records = jsondecode(file("./capacity_times.json"))
  file_name = "test.txt"

  capacity = local.capacity_records.capacity[local.hour]
}

#################################################
## Resources
#################################################

resource "local_file" "files" {
  content  = format("At %s the capacity will be set to %s\n", local.hour, local.capacity)
  filename = join("/", [var.output_path, basename(local.file_name)])
}
