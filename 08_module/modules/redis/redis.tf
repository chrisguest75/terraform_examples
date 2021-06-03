
resource "docker_container" "container" {
  name    = "redis"
  image   = var.image
  restart = "always"
}

