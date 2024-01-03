provider "aws" {
  region = var.region
}
terraform {
    backend "s3" {
        bucket = "surya-s3-bucket"
        key    = ""terraform/state/terraform.tfstate""
        region     = "ap-south-1"
        encrypt        = true 
        dynamodb_table  = "surya_table"
    }
} 
