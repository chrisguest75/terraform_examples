variable "ami" {}
variable "ssh_public_key" {}

variable "region" {}
variable "single_zone" {}

variable "availability_zones" {
  type = map
  default = {
  }
}

variable "tags" {
  type = map

  default = {
    "created_by"  = "terraform"
    "application" = "registry"
    "owner"       = "chrisguest"
  }
}

variable "repo_tags" {
  type = map

  default = {
    "repo"  = "terraform_examples/03_docker_registry_proxy"
  }
}

variable "bucket_name" {}
variable "vpc_cidr" {}

variable "default_vpcid" {}