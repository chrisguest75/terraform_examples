locals {
  containers = [
    {
      name:"nginx1"
      ports: {
        internal:"80"
        external:"8080"
      }      
    }
    , {
      name:"nginx2"
      ports: {
        internal:"80"
        external:"8081"
      }   
    }, {
      name:"nginx3"
      ports: {
        internal:"80"
        external:"8082"
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
  name    = each.value.name

  ports {
    internal = each.value.ports.internal
    external = each.value.ports.external
  }
  # dynamic "ports" {
  #   for_each = each.value.ports
  #   internal = "6379"
  #   external = "6380"
  # }
  image   = docker_image.nginx.latest
  restart = "no"
}


