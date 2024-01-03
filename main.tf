module "vpc" {
  source = "./modules/vpc"
}

# VPC Configuration (Place your existing VPC configuration here)

module "ec2" {
  source    = "./modules/ec2"
  depends_on = [
    module.vpc
  ]
  subnetpublic = module.vpc.pub_subnets
  sgs = [module.vpc.aws_security_group.sg.id]
}

module "rds" {
  source    = "./modules/rds"
  
depends_on = [
    module.vpc
  ]
  sgs = [module.vpc.aws_security_group.sg.id]
  dbsubgrp = module.vpc.pri_subnets

}
