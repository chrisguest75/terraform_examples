output "name" {
  description = "name of the running container"
  value       = module.my_redis.name
}

output "id" {
  description = "id of the running container"
  value       = module.my_redis.id
}

output "pathmodule" {
  description = "id of the running container"
  value       = module.my_redis.pathmodule
}