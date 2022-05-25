
resource "null_resource" "objects" {
}


resource "local_file" "file" {
  for_each = { for item in var.files : format("%s", item.filename) => item }
  content  = each.value.content
  filename = format("%s/%s", var.out_path, each.value.filename)
}