

resource "aws_s3_bucket" "s3bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_cors_configuration" "s3bucket" {
  bucket = aws_s3_bucket.s3bucket.id  

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }  
}

resource "aws_s3_bucket_ownership_controls" "s3bucket" {
  bucket = aws_s3_bucket.s3bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# resource "aws_s3_bucket_acl" "s3bucket" {
#   depends_on = [aws_s3_bucket_ownership_controls.s3bucket]

#   bucket = aws_s3_bucket.s3bucket.id
#   acl    = "public-read"
# }

resource "aws_s3_bucket_public_access_block" "s3bucket" {
  bucket = aws_s3_bucket.s3bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "s3bucket" {
  bucket = aws_s3_bucket.s3bucket.id

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

  depends_on = [aws_s3_bucket_public_access_block.s3bucket]
}

resource "aws_s3_object" "s3bucket" {
  bucket       = aws_s3_bucket.s3bucket.id
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"
  etag         = filemd5("./index.html")
}

resource "aws_s3_bucket_website_configuration" "s3bucket" {
  bucket = aws_s3_bucket.s3bucket.id

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
  value       = "http://${aws_s3_bucket_website_configuration.s3bucket.website_endpoint}"
  description = "The url of the s3 bucket"
}