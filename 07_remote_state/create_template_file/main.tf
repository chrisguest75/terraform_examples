
resource "local_file" "file" {
    content     = "This is my file $${template_variable}"
    filename = var.path
}