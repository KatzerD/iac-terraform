# Outputs.tf
output "bucket_name" {
  description = "Nombre del bucket S3"
  value       = aws_s3_bucket.terraform_state_bucket.bucket
}

output "bucket_arn" {
  description = "ARN del bucket S3"
  value       = aws_s3_bucket.terraform_state_bucket.arn
}
