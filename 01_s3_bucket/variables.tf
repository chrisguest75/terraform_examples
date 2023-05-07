variable "region" {}

variable "tags" {
  type = map(string)

  default = {
    "created_by"  = "terraform"
    "application" = "deb_packages"
    "owner"       = "chrisguest"
  }
}

variable "packages_file" {}
variable "deb_file" {}

variable "bucket_name" {}
