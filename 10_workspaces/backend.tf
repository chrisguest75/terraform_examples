terraform {
  required_version = "=0.15.5"

  backend "local" {
    path = "state/terraform.tfstate"
  }
}