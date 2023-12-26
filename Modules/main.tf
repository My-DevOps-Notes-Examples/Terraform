provider "aws" {
  region = "us-east-1"
}

module "vpc_module" {
  source = "./vpc_module"
  region = "us-east-1"
  vpc_info = {
    vpc_cidr        = "10.100.0.0/16"
    vpc_name        = "vpc-module"
    subnet_names    = ["app", "db", "web", "sql"]
    subnets_azs     = ["a", "b", "a", "b"]
    igw_name        = "igw-module"
    private_subnets = ["db", "sql"]
    public_subnets  = ["app", "web"]
  }
}

output "public_subnets_ids" {
  value = module.vpc_module.public_subnets_ids
}

output "private_subnets_ids" {
  value = module.vpc_module.private_subnets_ids
}