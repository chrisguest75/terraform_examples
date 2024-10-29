variables {
  ssm_path_bucket_name   = "/terraform/mocking/bucket_name"
}

provider "aws" {}

mock_provider "aws" {
  alias = "fake"

  override_data {
    target = data.aws_ssm_parameter.bucket_name
    values = {
      value = "my_bucket_name_from_ssm"
    }
  }

}

run "bucket_name_comes_from_ssm" {
  providers = {
    aws = aws.fake
  }
 
  command = plan
 
  assert {
    condition     = aws_s3_bucket.my_bucket.bucket == "my_bucket_name_from_ssm"
    error_message = "Bucket name should have come from SSM"
  }

}
 
