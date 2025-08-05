
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

target "cube-image-multi" {
  args = {
    VERSION = "0.0.0+unknown"
  }  
  context = "."
  platforms = ["linux/amd64", "linux/arm64"]
  dockerfile = "Dockerfile.ubuntu"
  tags = ["${IMAGE_NAME}:${IMAGE_TAG}"]
  output = []
  secret = [
    # pass by file; src is the secret file location
    "type=file,id=file_secret,src=./secrets/secret_token.txt",
    # pass by environment variable
    "type=env,id=SECRET_TOKEN"
  ]  
}

group "default" {
  targets = [
    "ubuntu-image-arm64",
    "ubuntu-image-amd64",
    ]
}