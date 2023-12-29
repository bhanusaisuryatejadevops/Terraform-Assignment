resource "aws_db_instance" "my_rds" {
  allocated_storage    = var.rds_allocated_storage
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = var.rds_engine_version  
  instance_class       = var.rds_instance_class 
  name                 = "my-rds"
  username             = var.rds_username  
  password             = var.random_password.password.result
  parameter_group_name = "default.postgres13" 
  skip_final_snapshot  = true

  # Configuration for the subnet group
  subnet_group_name = "private-subnet-group"
  
  # Security Group for RDS instance
  vpc_security_group_ids = [
    aws_security_group.rds_security_group.id,
  ]

  tags = {
    Name = "ExampleRDSInstance"
  }
}

# Creating a security group for RDS
resource "aws_security_group" "rds_security_group" {
  vpc_id = aws_vpc.main_vpc.id 

  # Ingress rule for PostgreSQL traffic within the security group
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.rds_security_group.id]  

    description = "PostgreSQL traffic within the security group"
  }

  # Egress rule to allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  tags = {
    Name = "RDS-Security-Group"
  }
}
