terraform {
  required_providers {
    time = {
      source = "hashicorp/time"
      # Setting the provider version is a strongly recommended practice
      version = "~> 0.7"
    }
  }
  # Provider functions require Terraform 1.8 and later.
  required_version = ">= 1.8.0"
}