terraform {
  required_version = "~>1.3.2"

  required_providers {
    honeycombio = {
      source  = "honeycombio/honeycombio"
      version = "0.13.1"
    }
  }

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

provider "honeycombio" {
}

variable "dataset" {
  type        = string
  default     = "23_triggers"
  description = "The dataset to requires some data to be present"
}

variable "marker_text" {
  type        = string
  default     = "marker_text"
  description = "The marker text to use for the marker"
}

resource "honeycombio_marker_setting" "deploymnt_marker" {
  type    = "deployment"
  color   = "#DF4661"
  dataset = var.dataset
}

resource "honeycombio_dataset" "my_dataset" {
  name        = var.dataset
  description = "A dataset for testing triggers"
}

# Create a marker
resource "honeycombio_marker" "marker" {
  message = var.marker_text
  type    = "deployment"

  dataset = var.dataset
}

