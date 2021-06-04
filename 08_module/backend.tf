terraform {
  required_version = "=0.13.7"

  backend "local" {
    path = "state/terraform.tfstate"
  }
}

