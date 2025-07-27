resource "local_file" "file" {
  content  = "This is a file"
  filename = "./tmp.txt"
}
