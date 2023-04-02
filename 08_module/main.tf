module "my_redis" {
  source = "./modules/redis"

  name = "my_redis"
  image = "redis:6.2-alpine"
}
