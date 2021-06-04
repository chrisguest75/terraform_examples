// https://github.com/kreuzwerker/terraform-provider-docker
terraform {
  required_version = "=0.13.7"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.12.1"
    }
  }
}

resource "docker_container" "container" {
  name    = "redis"
  image   = var.image
  restart = "always"
}

