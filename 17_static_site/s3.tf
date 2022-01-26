

resource "aws_s3_bucket" "static_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

  tags = var.tags

  website {
    index_document = "index.html"
  }

  /*cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://s3-website-test.hashicorp.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }*/

}

resource "aws_s3_bucket_object" "root" {
  bucket       = aws_s3_bucket.static_bucket.id
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"
  etag         = filemd5("./index.html")
}

resource "aws_s3_bucket_object" "website" {
  for_each = fileset(var.website_build_folder, "*")
  bucket = aws_s3_bucket.static_bucket.id
  key = "${var.website_build_folder}/${each.value}"

  source = "${var.website_build_folder}/${each.value}"
  content_type = "text/html"
  etag = filemd5("${var.website_build_folder}/${each.value}")

}

resource "aws_s3_bucket_policy" "static_bucket_policy" {
  bucket = aws_s3_bucket.static_bucket.id

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

output "s3_url" {
  value       = "http://${aws_s3_bucket.static_bucket.website_endpoint}"
  description = "The url of the s3 bucket"
}