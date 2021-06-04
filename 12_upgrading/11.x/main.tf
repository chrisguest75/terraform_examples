terraform {
    required_version = "=0.11.15"

    backend "local" {
        path = "../state/terraform.tfstate"
    }
}

provider "docker" {
}

resource "local_file" "file1" {
    content     = "This is my file1"
    filename = "../files/myfile1.txt"
}

resource "local_file" "file2" {
    content     = "This is my file2"
    filename = "../files/myfile2.txt"
}

resource "docker_container" "container1" {
  name    = "redis1"
  image   = "redis:6.2-alpine"
  restart = "always"
}

resource "docker_container" "container2" {
  name    = "redis2"
  image   = "redis:6.2-alpine"
  restart = "always"
}