terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "Temzy"
  allowed_account_ids = ["326355388919"]
}

####################################
#           US-EAST-1 RESOURCES    #
####################################


module "temzy_vpc" {
  source  = "./vpc/"
}

# module "temzy_eks_dev" {
#   source  = "./eks/"
# }
