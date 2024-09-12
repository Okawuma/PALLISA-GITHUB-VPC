# configure aws provider
provider "aws" {
  region  = var.region
  profile = "kawuma-cli"
}

# create vpc for pallisa hospital using the vpc root module.
# reference the root vpc module
module "pallisa-root-vpc" {
  source                      = "../modules/pallisa-root-vpc"
  region                      = var.region
  project_name                = var.project_name
  vpc_cidr                    = var.vpc_cidr
  public_subnet_az1_cidr      = var.public_subnet_az1_cidr
  public_subnet_az2_cidr      = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr = var.private_app_subnet_az2_cidr
  private_db_subnet_az1_cidr  = var.private_db_subnet_az1_cidr
  private_db_subnet_az2_cidr  = var.private_db_subnet_az2_cidr
}
# created Nat-gateway
module "pallisa-nat-gateway" {
  source                    = "../modules/Nat-gateway"
  public_subnet_az1_id      = modules.pallisa-hospital-vpc.public_subnet_az1_id
  aws_internet_gateway      = modules.pallisa-hospital-vpc.aws_internet_gateway
  vpc_id                    = modules.pallisa-hospital-vpc.vpc_id
  public_subnet_az2_id      = modules.pallisa-hospital-vpc.public_subnet_az2_id
  private_app_subnet_az1_id = modules.pallisa-hospital-vpc.private_app_subnet_az1_id
  private_db_subnet_az1_id  = modules.pallisa-hospital-vpc.private_db_subnet_az1_id
  private_app_subnet_az2_id = modules.pallisa-hospital-vpc.private_app_subnet_az2_id
  private_db_subnet_az2_id  = modules.pallisa-hospital-vpc.private_db_subnet_az2_id
}
