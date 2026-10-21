
output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.my_ec2.id
}

output "ami_id" {
  description = "AMI used by the instance"
  value       = aws_instance.my_ec2.ami
}

output "private_ip" {
  description = "Private IP address"
  value       = aws_instance.my_ec2.private_ip
}
