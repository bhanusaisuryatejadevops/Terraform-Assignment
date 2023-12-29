provider "aws" {
  region = var.region
}
terraform {
    backend "s3" {
        bucket = "surya-s3-bucket"
        key    = "C:\Users\ADMIN\Desktop\vpc\terraform.tfstate"
        region     = "us-west-2"
        encrypt        = true 
        dynamodb_table  = "surya_table"
    }
} 