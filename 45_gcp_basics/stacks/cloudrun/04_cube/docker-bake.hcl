
variable "IMAGE_NAME" {
  default = "04_cube"
}
variable "IMAGE_TAG" {
  default = "latest"
}

#***********************************************
# Cube images
#***********************************************

target "cube-image-amd64" {
  args = {
    VERSION = "0.0.0+unknown"
  }
  context = "."
  platforms = ["linux/amd64"]
  dockerfile = "Dockerfile"
  tags = ["${IMAGE_NAME}_amd64:${IMAGE_TAG}"]
  output = ["type=docker"]
}

target "cube-image-arm64" {
  args = {
    VERSION = "0.0.0+unknown"
  }
  context = "."
  platforms = ["linux/arm64"]
  dockerfile = "Dockerfile"
  tags = ["${IMAGE_NAME}_arm64:${IMAGE_TAG}"]
  output = ["type=docker"]
}

target "push-cloudrun-image-amd64" {
  args = {
    VERSION = "0.0.0+unknown"
  }
  context = "."
  platforms = ["linux/amd64"]
  dockerfile = "Dockerfile"
  tags = ["${IMAGE_TAG}"]
  output = ["type=docker"]
}

group "default" {
  targets = [
    "cube-image-arm64",
    "cube-image-amd64",
    ]
}