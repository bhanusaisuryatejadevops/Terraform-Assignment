output "ec2_instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.ec2.id
}

output "ec2_instance_public_ip" {
  description = "Public IP address of the created EC2 instance"
  value       = aws_instance.ec2.public_ip
}

output "ec2_instance_private_ip" {
  description = "Private IP address of the created EC2 instance"
  value       = aws_instance.ec2.private_ip
}

