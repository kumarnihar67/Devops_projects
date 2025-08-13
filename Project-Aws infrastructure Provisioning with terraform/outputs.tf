output "ec2_public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.web.public_ip
}
