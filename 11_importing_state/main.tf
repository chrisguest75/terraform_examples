terraform {
  required_version = "=1.2.1"

  backend "local" {
    path = "./state/terraform.tfstate"
  }

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.12.1"
    }
  }
}

provider "docker" {}

locals {
  containers = [
    {
      name : "nginx1"
      ports : {
        internal : "80"
        external : "8080"
      }
    }
  ]
}

resource "docker_image" "nginx" {
  name         = "nginx:1.20.1"
  keep_locally = true
}

resource "docker_container" "container" {
  # strange logic seems to be so resource has a name
  for_each = { for container in local.containers : container.name => container }
  name     = each.value.name

  ports {
    internal = each.value.ports.internal
    external = each.value.ports.external
  }
  image   = docker_image.nginx.latest
  restart = "no"
}
