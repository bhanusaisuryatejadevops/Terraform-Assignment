variable "pubsubnet" {
    description = "CIDR blocks for public subnets"
    default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  
}

variable "prisubnet" {
    description = "CIDR blocks for private subnets"
    default = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
  
}

variable "azones" {
  description = "Availability zones"
  default = ["us-west-2a","us-west-2b","ap-south-1"]
}
