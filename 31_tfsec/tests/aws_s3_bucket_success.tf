resource "aws_s3_bucket" "deb_bucket" {
  bucket = var.bucket_name

  tags = {
    owner      = "chrisguest"
    created_by = "chrisguest"
  }
}
