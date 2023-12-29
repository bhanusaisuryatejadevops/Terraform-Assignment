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
