terraform {
  required_version = "=0.15.5"

  backend "local" {
    path = "../state/terraform.tfstate"
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
  path1 = "../files/myfile1.txt"
  path2 = "../files/myfile2.txt"
  name1 = "redis1"
  name2 = "redis2"
}

resource "local_file" "file1" {
  content  = "This is my file1"
  filename = local.path1
}

resource "local_file" "file2" {
  content  = "This is my file2"
  filename = local.path2
}

resource "docker_container" "container1" {
  name    = local.name1
  image   = "redis:6.2-alpine"
  restart = "always"
}

resource "docker_container" "container2" {
  name    = local.name2
  image   = "redis:6.2-alpine"
  restart = "always"
}
