output "vpc_id" {
  description = "The ID of the provisioned custom VPC."
  value       = aws_vpc.main_vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet."
  value       = aws_subnet.public_subnet.id
}

output "security_group_id" {
  description = "The ID of the Web Security Group."
  value       = aws_security_group.web_sg.id
}

output "ec2_instance_id" {
  description = "The instance ID of the EC2 Web Server."
  value       = aws_instance.web_server.id
}

output "ec2_public_ip" {
  description = "The public IPv4 address assigned to the EC2 web server."
  value       = aws_instance.web_server.public_ip
}

output "web_application_url" {
  description = "The HTTP access URL to the deployed web application."
  value       = "http://${aws_instance.web_server.public_ip}"
}

output "s3_bucket_name" {
  description = "The name of the provisioned S3 application bucket."
  value       = aws_s3_bucket.app_storage.id
}

output "s3_bucket_arn" {
  description = "The ARN of the provisioned S3 bucket."
  value       = aws_s3_bucket.app_storage.arn
}
