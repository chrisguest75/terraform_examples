
terraform {
  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

module "files" {
  source = "../modules/files"
  output_path = join(path.cwd, ["../output"])
}

# NOTE: Files do not work with import block
# removed {
#   from = module.files.local_file.files
#   lifecycle {
#     destroy = false
#   }
# }

############################################################
## Step 1
## Comment out when in step 2
############################################################

module "my_redis" {
  source = "../modules/redis"

  name  = "my_redis"
  image = "redis:6.2-alpine"
}

############################################################
## Step 2
## Comment out when in step 1
############################################################

# removed {
#   from = module.my_redis.docker_container.container
#   lifecycle {
#     destroy = false
#   }
# }

