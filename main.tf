module "vpc" {
  source = "./modules/vpc"
}
module "ec2" {
  source = "./ec2" 
  depends_on = [
    module.vpc
  ]
  subnetpublic = module.vpc.pub_subnets
  sgs = module.vpc.security_group_ic
}
module "rds" {
  source = "./rds" 
  sgs=module.vpc.security_group_ic
  dbsubgrp = module.vpc.private_subnet_cidrs
  depends_on = [
    module.vpc
  ]
}
