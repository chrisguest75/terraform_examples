variable "ssh_public_key" {}
variable "region" {}

variable "instance_type" {}

variable "tags" {
  type = map(string)

  default = {
    "created_by"  = "terraform"
    "application" = "network"
    "owner"       = "chrisguest"
  }
}