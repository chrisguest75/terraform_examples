variable "ami" {}
variable "ssh_public_key" {}
variable "region" {}

variable "availability_zones" {
  type = "list"
}
variable "tags" {
  type = "map"

  default = {
    "created_by"  = "terraform"
    "application" = "network"
    "owner"       = "chrisguest"
  }
}