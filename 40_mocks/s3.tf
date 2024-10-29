

data "aws_ssm_parameter" "bucket_name" {
  name = var.ssm_path_bucket_name
}


resource "aws_s3_bucket" "my_bucket" {
  bucket = data.aws_ssm_parameter.bucket_name.value
  
}

