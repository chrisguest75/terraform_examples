// https://github.com/kreuzwerker/terraform-provider-docker
terraform {


  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">=3.0.2"
    }
  }
}

resource "docker_container" "container" {
  name    = var.name
  image   = var.image
  restart = "always"
}

