############################################################
# Creates a state bucket for use by the main example
############################################################

terraform {
  required_version = "=1.4.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile

  default_tags {
    tags = {
      "created_by"  = "terraform"
      "application" = "static-site"
      "owner"       = "chrisguest"
      "gitrepopath" = "17_static_site"
      "gitrepo"     = "https://github.com/chrisguest75/terraform_examples"
    }
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = var.state_table_name
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state_access" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

# resource "aws_s3_bucket_policy" "terraform_state" {
#   bucket = "${aws_s3_bucket.terraform_state.id}"
#   policy =<<EOF
# {
#   "Version": "2012-10-17",
#   "Id": "RequireEncryption",
#    "Statement": [
#     {
#       "Sid": "RequireEncryptedTransport",
#       "Effect": "Deny",
#       "Action": ["s3:*"],
#       "Resource": ["arn:aws:s3:::${aws_s3_bucket.terraform_state.bucket}/*"],
#       "Condition": {
#         "Bool": {
#           "aws:SecureTransport": "false"
#         }
#       },
#       "Principal": "*"
#     },
#     {
#       "Sid": "RequireEncryptedStorage",
#       "Effect": "Deny",
#       "Action": ["s3:PutObject"],
#       "Resource": ["arn:aws:s3:::${aws_s3_bucket.terraform_state.bucket}/*"],
#       "Condition": {
#         "StringNotEquals": {
#           "s3:x-amz-server-side-encryption": "AES256"
#         }
#       },
#       "Principal": "*"
#     }
#   ]
# }
# EOF
# }