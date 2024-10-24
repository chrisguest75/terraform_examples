

resource "aws_s3_bucket" "deb_bucket" {
  bucket = var.bucket_name

  tags = var.tags

  /*cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://s3-website-test.hashicorp.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }*/

}

resource "aws_s3_bucket_ownership_controls" "deb_bucket" {
  bucket = aws_s3_bucket.deb_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "deb_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.deb_bucket]

  bucket = aws_s3_bucket.deb_bucket.id
  #tfsec:ignore:aws-s3-no-public-access-with-acl
  acl = "public-read"
}
# resource "aws_s3_object" "packages" {
#   bucket = aws_s3_bucket.deb_bucket.id
#   key    = "dists/debian/Packages/binary-amd64/Packages.gz"
#   source = var.packages_file

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = "${md5(file("path/to/file"))}"
#   etag = filemd5(var.packages_file)
# }

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.deb_bucket.id
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"
  etag         = filemd5("./index.html")
}

# resource "aws_s3_object" "package_files" {
#   bucket = aws_s3_bucket.deb_bucket.id
#   key    = "packages/hello-world_1.0_all.deb"
#   source = var.deb_file

#   etag = filemd5(var.deb_file)
# }

resource "aws_s3_bucket_policy" "deb_bucket_policy" {
  bucket = aws_s3_bucket.deb_bucket.id

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

resource "aws_s3_bucket_website_configuration" "deb_bucket" {
  bucket = aws_s3_bucket.deb_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  /*routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }*/
}


output "s3_url" {
  value       = "http://${aws_s3_bucket_website_configuration.deb_bucket.website_endpoint}"
  description = "The url of the s3 bucket"
}
