variable "region" {}

variable "tags" {
  type = "map"

  default = {
    "created_by"  = "terraform"
    "application" = "deb_packages"
    "owner"       = "chrisguest"
  }
}