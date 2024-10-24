variable "region" {}

variable "tags" {
  type = map(string)

  default = {
    "created_by"  = "terraform"
    "application" = "deb_packages"
    "owner"       = "chrisguest"
  }
}

variable "bucket_name" {}
