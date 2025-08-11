output "s3_website_url" {
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
  description = "The public URL of the static website hosted on S3"
}
