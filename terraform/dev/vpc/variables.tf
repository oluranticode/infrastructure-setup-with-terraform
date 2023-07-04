# # VPC VARIABLES
variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "us-east-1-temzy-vpc-dev"
}
variable "region" {
  description = "Name of region"
  type        = string
  default     = "us-east-1"
}
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "172.16.0.0/16"
}
variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list
  default     = ["us-east-1a", "us-east-1b"]
}
variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["172.16.0.0/19", "172.16.32.0/19"]
}
variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["172.16.96.0/19", "172.16.128.0/19"]
}
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type    = bool
  default = true
}
