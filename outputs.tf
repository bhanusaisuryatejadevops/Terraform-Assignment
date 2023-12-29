output "ec2_instance_ip" {
  description = "Public IP address of the created EC2 instance"
  value       = module.ec2.public_ip
}

output "rds_instance_endpoint" {
  description = "Endpoint of the created RDS instance"
  value       = module.rds.endpoint
}