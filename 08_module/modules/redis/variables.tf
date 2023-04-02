
variable name {
  type    = string
  description = "The name of the container"
  validation {
    condition     = length(var.name) > 5
    error_message = "Name must be set and longer than 5 characters."
  }
}

variable image {
  type    = string
  default = "redis:6.2.4-alpine"
  description = "The image:tag to use for the container."
  validation {
    condition     = substr(var.image, 0, 5) == "redis"
    error_message = "Image must be redis."
  }
}