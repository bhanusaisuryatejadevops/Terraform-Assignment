output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.myvpc.id
}

output "public_subnet_ids" {
  description = "List of IDs of the created public subnets"
  value       = aws_subnet.subnet_pub[*].id
}

output "private_subnet_ids" {
  description = "List of IDs of the created private subnets"
  value       = aws_subnet.subnet_pri[*].id
}

output "internet_gateway_id" {
  description = "The ID of the created Internet Gateway"
  value       = aws_internet_gateway.myigw.id
}

output "nat_gateway_id" {
  description = "The ID of the created NAT Gateway"
  value       = aws_nat_gateway.icnat.id
}

output "default_security_group_id" {
  description = "The ID of the default security group"
  value       = aws_security_group.default.id
}
