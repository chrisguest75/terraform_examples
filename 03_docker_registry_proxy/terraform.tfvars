single_zone = "eu-west-1a"
region      = "eu-west-1"
ami         = "ami-0bbc25e23a7640b9b"

private_cidr    = "172.0.0.0/8"
vpc_cidr    = "172.33.0.0/16"
availability_zones = {
  "eu-west-1a" = "172.33.1.0/24"
  "eu-west-1b" = "172.33.1.0/24"
  "eu-west-1c" = "172.33.1.0/24"
}

bucket_name = "experimental-docker-images-store"

default_vpc_id = ""
default_vpc_cidr = ""
default_vpc_route_table_id = ""
