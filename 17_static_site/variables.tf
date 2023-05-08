variable "profile" {}

variable "region" {}

variable "tags" {
  type = map(any)

  default = {
    "extra_tags" = "bucket for static website"
  }
}

variable "bucket_name" {}

variable "website_build_folder" {}

variable "state_bucket_name" {}

variable "state_table_name" {}
