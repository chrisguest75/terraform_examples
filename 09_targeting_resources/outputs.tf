output "id" {
  description = "id of the running container"
  value = {
    for container in docker_container.container :
    container.name => container.id
  }
}

