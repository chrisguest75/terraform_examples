
variable "tags" {
  type = map(string)

  default = {
    "created_by"  = "terraform"
    "application" = "32_multiple_providers"
    "owner"       = "chrisguest"
  }
}

