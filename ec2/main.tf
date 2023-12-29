resource "aws_key_pair" "my_key_pair" {
  key_name   = var.ec2_key_name
  public_key = file("C:\Users\ADMIN/.ssh/id_rsa.pub")
}
resource "tls_private_key" "ec2key" {
    algorithm = "RSA"
    rsa_bits = 4096
}
resource "local_file" "ec2pemkey" {
    filename = "ec2-key.pem"
    content = tls_private_key.ec2key.private_key_pem
}
resource "aws_security_group" "ssh_sg" {
  name        = "ssh-security-group"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.existing_vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "ssh-sg"
  }
}

# Launch an EC2 instance in the existing subnet
resource "aws_instance" "my_ec2_instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = var.ec2_subnet_id
  security_groups = var.ec2_security_group_id

  tags = {
    Name = "my-ec2-instance"
  }
}
