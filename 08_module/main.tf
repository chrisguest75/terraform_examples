module "my_redis" {
  source = "./modules/redis"

  image = "redis:6.2-alpine"
}
