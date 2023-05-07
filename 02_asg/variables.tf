variable "ami" {}
variable "ssh_public_key" {}
variable "region" {}

variable "availability_zones" {
  type = list(string)
}
variable "tags" {
  type = map(string)

  default = {
    "created_by"  = "terraform"
    "application" = "network"
    "owner"       = "chrisguest"
  }
}