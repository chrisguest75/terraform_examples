

resource "aws_s3_bucket" "deb_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"

  tags = "${var.tags}"

  website {
    index_document = "Packages.gz"
  }
}

resource "aws_s3_bucket_object" "packages" {
  bucket = "${aws_s3_bucket.deb_bucket.id}"
  key    = "Packages.gz"
  source = "${var.packages_file}"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = "${filemd5(var.packages_file)}"
}

resource "aws_s3_bucket_object" "package_files" {
  bucket = "${aws_s3_bucket.deb_bucket.id}"
  key    = "hello-world.deb"
  source = "./test-deb-packages/hello-world.deb"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = "${filemd5("./test-deb-packages/hello-world.deb")}"
}

resource "aws_s3_bucket_policy" "deb_bucket_policy" {
  bucket = "${aws_s3_bucket.deb_bucket.id}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}/*"
            ]
        }
    ]
}
POLICY
}

