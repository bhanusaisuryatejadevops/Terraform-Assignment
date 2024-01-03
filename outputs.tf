output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.vpc_module.vpc_id
}

output "ec2_instance_details" {
  description = "Details of the created EC2 instance"
  value       = module.ec2.public_ip
}

output "rds_postgres_details" {
  description = "Details of the created RDS PostgreSQL instance"
  value       = module.rds
}
