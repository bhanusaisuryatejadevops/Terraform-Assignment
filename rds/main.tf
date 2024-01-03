resource "aws_db_instance" "defalut" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "var.engine
  engine_version       = var.engine_version  
  instance_class       = var.instanceclass 
  name                 = "mydb"
  username             = var.username  
  password             = var.random_password.password.result
  parameter_group_name = "postgresgroup" 
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.dbsubnetgroup.name

  resource "aws_db_subnet_group" "dbsubnetgroup" {
    
  name       = "dbsubgroup"
  subnet_ids = var.dbsubgrp

  tags = {
    Name = "My DB subnet group"
  }
}
