output "bucket_name" {
  description = "The globally unique name of the S3 bucket created."
  value       = aws_s3_bucket.demo_bucket.id
}

output "bucket_arn" {
  description = "The Amazon Resource Name (ARN) of the bucket."
  value       = aws_s3_bucket.demo_bucket.arn
}

output "bucket_region" {
  description = "The AWS Region where the bucket is hosted."
  value       = aws_s3_bucket.demo_bucket.region
}

output "versioning_status" {
  description = "The versioning state of the S3 bucket."
  value       = aws_s3_bucket_versioning.demo_bucket_versioning.versioning_configuration[0].status
}
