variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ec2_ami" {
  description = "EC2 AMI ID"
  default     = "ami-0c7217cdde317cfec"
}

variable "ec2_key_name" {
  description = "Key pair name for EC2 SSH access"
  default     = "my-keypair"
}

variable "ec2_security_group_id" {
  description = "ID of the security group associated with EC2"
  # Add your security group ID or provide it during runtime
}

variable "ec2_subnet_id" {
  description = "ID of the subnet where EC2 will be launched"
  # Add your subnet ID or provide it during runtime
}
