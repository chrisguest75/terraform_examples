terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.12.1"
    }
  }
}

provider "docker" {}