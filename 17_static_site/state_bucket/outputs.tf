
output "state_bucket_name" {
  value       = aws_s3_bucket.terraform_state.bucket
  description = ""
  sensitive   = false
}

output "state_lock_table_name" {
  value       = aws_dynamodb_table.terraform_state_lock.name
  description = ""
  sensitive   = false
}