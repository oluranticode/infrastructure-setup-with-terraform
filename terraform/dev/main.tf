terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "temzy"
  allowed_account_ids = ["454617234462"]
}

####################################
#           US-EAST-1 RESOURCES    #
####################################


module "temzy_vpc" {
  source  = "./vpc/"
}

module "temzy_eks_dev" {
  source  = "./eks/"
}
