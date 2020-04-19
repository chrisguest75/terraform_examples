

resource "aws_s3_bucket" "deb_bucket" {
  bucket = "test-conde-deb-packages"
  acl    = "public-read"

  tags = "${var.tags}"
}


# resource "aws_s3_bucket_policy" "deb_bucket_policy" {
#   bucket = "${aws_s3_bucket.deb_bucket.id}"

#   policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Id": "MYBUCKETPOLICY",
#   "Statement": [
#     {
#       "Sid": "IPAllow",
#       "Effect": "Deny",
#       "Principal": "*",
#       "Action": "s3:*",
#       "Resource": "arn:aws:s3:::my_tf_test_bucket/*",
#       "Condition": {
#          "IpAddress": {"aws:SourceIp": "8.8.8.8/32"}
#       }
#     }
#   ]
# }
# POLICY
# }

