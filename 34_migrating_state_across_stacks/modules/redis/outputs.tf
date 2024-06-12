output "name" {
  description = "name of the running container"
  value       = docker_container.container.name
}

output "id" {
  description = "id of the running container"
  value       = docker_container.container.id
}

output "pathmodule" {
  description = "Output the path of the module"
  value       = "${path.module}"
}