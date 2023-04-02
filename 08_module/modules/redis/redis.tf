// https://github.com/kreuzwerker/terraform-provider-docker
terraform {
  # NOTE: This would restrict the version of terraform to 0.13.7 for module using this module.
  # It seems to be genrally better to set the version in the root module.
  # required_version = "=0.13.7"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">=2.12.1"
    }
  }
}

resource "docker_container" "container" {
  name    = var.name
  image   = var.image
  restart = "always"
}

