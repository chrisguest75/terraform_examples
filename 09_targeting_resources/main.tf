# create unique names
# create an array output each container id. 
resource "docker_container" "container1" {
  name    = "redis"
  image   = "redis:6.2-alpine"
  restart = "always"
}

resource "docker_container" "container2" {
  name    = "redis"
  image   = "redis:6.2-alpine"
  restart = "always"
}

