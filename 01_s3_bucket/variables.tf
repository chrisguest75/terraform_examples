variable "region" {}

variable "tags" {
  type = "map"

  default = {
    "created_by"  = "terraform"
    "application" = "deb_packages"
    "owner"       = "chrisguest"
  }
}

variable "packages_file" {}
variable "bucket_name" {}
