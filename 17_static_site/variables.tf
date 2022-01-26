variable "region" {}

variable "tags" {
  type = map(any)

  default = {
    "extra_tags" = "bucket for static website"
  }
}

variable "bucket_name" {}

variable "state_bucket_name" {}

variable "state_table_name" {}