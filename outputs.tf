output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app_server.id
}

output "ami_id" {
  description = "AMI used by the instance"
  value       = aws_instance.app_server.ami
}

output "private_ip" {
  description = "Private IP address"
  value       = aws_instance.app_server.private_ip
}
