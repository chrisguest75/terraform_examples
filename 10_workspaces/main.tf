locals {
  filepath = var.path
}

resource "local_file" "file" {
  content  = "This is my file"
  filename = local.filepath
}
