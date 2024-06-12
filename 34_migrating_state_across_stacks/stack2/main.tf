
terraform {
  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

#module "files" {
#  source = "../modules/files"
#  output_path = join(path.cwd, ["../output"])
#}

# import {
#   to = module.files.local_file.files["1.txt"]
#   id = "../output/1.txt"
# }

# import {
#   to = module.files.local_file.files["2.txt"]
#   id = "../output/2.txt"
# }

############################################################
## Step 1
############################################################

module "my_redis" {
  source = "../modules/redis"

  name  = "my_redis"
  image = "redis:6.2-alpine"
}

############################################################
## Step 2
## Uncomment when in step 2
############################################################

# import {
#   to = module.my_redis.docker_container.container
#   id = "dbb35e0ee0eca3e72bf2c27d1d5cc401b467d12759a1e8d2ca6e33cd28afeb8b"
# }