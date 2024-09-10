terraform {
  backend "s3" {
    bucket  = "pallisahospital-remotestate-2024"
    key     = "pallisa-vpc-child-module-state.tfstate"
    region  = "eu-west-2"
    profile = "kawuma-cli"
  }
}