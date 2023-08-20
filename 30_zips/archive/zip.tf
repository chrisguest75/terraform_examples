locals {
  code_zip_path = "../out/archive.zip"
}

data "archive_file" "zip" {
  source_dir = "../../00_basic_practices"
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
