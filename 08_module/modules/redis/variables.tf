
variable image {
  type    = string
  default = "redis:6.2.4-alpine"
  description = "The image:tag to use for the container."
  validation {
    condition     = substr(var.image, 0, 5) == "redis"
    error_message = "Image must be redis."
  }
}