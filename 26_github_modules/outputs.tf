
output "id" {
  description = "ids of the running container"
  value = tolist([{
    id   = module.my_redis1.id,
    name = module.my_redis1.name,
    }, {
    id   = module.my_redis2.id,
    name = module.my_redis2.name,
  }])
}
