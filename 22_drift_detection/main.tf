locals {
  containers = [
    {
      name : "nginx1"
      ports : [{
        internal : "80"
        external : "8080"
        }, {
        internal : "90"
        external : "8090"
        }, {
        internal : "100"
        external : "8100"
        }
      ]
    },
    {
      name : "nginx2"
      ports : [{
        internal : "80"
        external : "8081"
      }]
    },
    {
      name : "nginx3"
      ports : [{
        internal : "80"
        external : "8082"
      }]
    },
    {
      name : "nginx4"
      ports : []
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

  dynamic "ports" {
    for_each = each.value.ports
    iterator = port
    content {
      internal = port.value.internal
      external = port.value.external
    }
  }

  image   = docker_image.nginx.image_id
  restart = "no"
}


