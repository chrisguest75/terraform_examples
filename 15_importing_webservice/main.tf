terraform {
  required_version = "=0.15.05"

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

#################################################
## Variables
#################################################

variable "base_api_url" {
  type    = string
  default = "http://goweather.herokuapp.com/weather/"

  #validation {
  #   condition     = substr(var.base_url, 0, 4) == "http"
  #   error_message = "base_api_url does not start with http"
  # }
}

variable "location" {
  type    = string
  default = "ReadingUK"
}

#################################################
## Locals
#################################################

locals {
  url               = format("%s%s", var.base_api_url, var.location)
  weather_data      = data.http.webservice
  weather_data_body = jsondecode(local.weather_data.body)
  render_html       = templatefile("./template_config/template.html", { temperature = local.weather_data_body.temperature, wind = local.weather_data_body.wind, "description" = local.weather_data_body.description })
}

data "http" "webservice" {
  url = local.url

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

#################################################
## Resources
#################################################

resource "local_file" "html" {
  content  = local.render_html
  filename = "./nginx/index.html"

  #depends_on = [data.http.webservice]
}

resource "local_file" "conf" {
  content = file("./template_config/nginx.conf")
  #content     = "test"
  filename = "./nginx/nginx.conf"
}

output "weather_data" {
  value = local.weather_data
}

output "temperature" {
  value = local.weather_data_body.temperature
}

output "wind" {
  value = local.weather_data_body.wind
}

output "description" {
  value = local.weather_data_body.description
}


locals {
  containers = [
    {
      name : "nginx1"
      ports : {
        internal : "80"
        external : "8080"
      }
      volumes : [
        {
          container_path : "/etc/nginx/nginx.conf"
          host_path : "./nginx/nginx.conf"
        },
        {
          container_path : "/usr/share/nginx/html/index.html"
          host_path : ".nginx/index.html"
        }
      ]
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

  /*dynamic "volumes" {
    for_each = each.value.volumes
    content {
      container_path = each.value["container_path"]
      host_path = each.value["host_path"]
    }
  }*/

  volumes {
    container_path = "/etc/nginx/nginx.conf"
    host_path      = abspath("./nginx/nginx.conf")
  }
  volumes {
    container_path = "/usr/share/nginx/html/index.html"
    host_path      = abspath("./nginx/index.html")
  }

  image   = docker_image.nginx.latest
  restart = "always"
}