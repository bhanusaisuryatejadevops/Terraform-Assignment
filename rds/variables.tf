variable "rds_instance_identifier" {
  description = "Identifier for the RDS instance"
  default     = "my-rds-instance" 
}

variable "rds_engine" {
  description = "RDS database engine (e.g., postgres)"
  default     = "postgres" 
}

variable "rds_engine_version" {
  description = "RDS database engine version"
  default     = "13.4"  
}

variable "rds_instance_class" {
  description = "RDS instance class"
  default     = "db.t2.micro" 
}
