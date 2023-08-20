locals {
  code_zip_path = "../out/provisioner.zip"
}

resource "null_resource" "zip_files" {
  provisioner "local-exec" {
    working_dir = "./"
    command     = <<EOT
    mkdir -p ../out
    zip -b . -r ${local.code_zip_path} ../README.md ../../00_basic_practices
    EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

# output "filebase64sha256" {
#     depends_on = [ null_resource.zip_files ] 
#    value = filebase64sha256(local.code_zip_path)
# }
