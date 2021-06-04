
variable image {
  type    = string
  default = "redis:6.2.4-alpine"

  validation {
    condition     = substr(var.image, 0, 5) == "redis"
    error_message = "Image must be redis."
  }
}