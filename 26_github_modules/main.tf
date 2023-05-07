module "my_redis1" {
  # NOTE: Normally you would not reference the same repo back to a previous version.  
  # This is just to demonstrate the use of a specific version of a module.
  source = "git::https://github.com/chrisguest75/terraform_examples//08_module/modules/redis?ref=3ae2ca402d268c465998083ae19cb65787603674"

  name = "my_redis1"
  image = "redis:6.2-alpine"
}

module "my_redis2" {
  # NOTE: Normally you would not reference the same repo back to a previous version.  
  # This is just to demonstrate the use of a specific version of a module.
  source = "git::https://github.com/chrisguest75/terraform_examples//08_module/modules/redis?ref=3ae2ca402d268c465998083ae19cb65787603674"

  name = "my_redis2"
  image = "redis:6.2.11-alpine"
}
