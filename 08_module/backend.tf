terraform {
  required_version = "=0.12.31"

  backend "local" {
    path = "state/terraform.tfstate"
  }
}

