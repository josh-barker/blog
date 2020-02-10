output "s3_bucket" {
  value = aws_s3_bucket.www.website_endpoint
}

output "endpoint" {
  value = aws_route53_record.www.name
}

