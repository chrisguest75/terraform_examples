# foo/main.tf
variable "content" {}

resource "local_file" "file" {
  content  = var.content
  filename = "${path.module}/hi.txt"
}


output "content" {
  value = local_file.file.content
}