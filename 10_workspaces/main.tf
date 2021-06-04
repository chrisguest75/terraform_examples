locals {
  filepath = "./files/files.txt"
}

resource "local_file" "file" {
  content  = "This is my file"
  filename = local.filepath
}