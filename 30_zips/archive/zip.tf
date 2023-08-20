locals {
  code_zip_path = "../out/archive.zip"
}

resource "null_resource" "zip_files" {
  provisioner "local-exec" {
    working_dir = "./"
    command     = <<EOT
    mkdir -p ./zip_source_data
    cp ../README.md ./zip_source_data
    cp -R ../../00_basic_practices ./zip_source_data
    EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

data "archive_file" "zip" {
  depends_on = [ 
    null_resource.zip_files
   ]
  source_dir = "zip_source_data"
  //source_file = "../README.md"

  output_path = local.code_zip_path
  type        = "zip"
}

output "output_path" {
  value = data.archive_file.zip.output_path
}

output "output_size" {
  value = data.archive_file.zip.output_size 
}

output "output_base64sha256" {
  value = data.archive_file.zip.output_base64sha256 
}

output "output_base64sha512" {
  value = data.archive_file.zip.output_base64sha512
}
