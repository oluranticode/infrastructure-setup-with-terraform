locals {
  cluster_name = "us-east-1-temzy-cluster-dev"
}
data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.20.0"
  cluster_version = "1.23"
  cluster_name    = local.cluster_name
  vpc_id          = "vpc-036a62ac5b6714c9f"
  subnets         = ["subnet-0a2c61b271cd3b556", "subnet-03f73661c2a25e945"]
  manage_aws_auth = true

  node_groups = {
    node-group-1 = {
      name                   = "temzy-cluster-dev"
      desired_capacity       = 1
      max_capacity           = 5
      min_capacity           = 1
      instance_types         = ["m6in.large"]
      capacity_type          = "ON_DEMAND"
      create_launch_template = true
      additional_tags = {
        "Environment"                                     = "dev"
        "Terraform"                                       = "true"
        "k8s.io/cluster-autoscaler/${local.cluster_name}" = "owned"
        "k8s.io/cluster-autoscaler/enabled "              = "true"
      }
    }
  }

}
resource "aws_eks_addon" "kube-proxy" {
  cluster_name      = local.cluster_name
  addon_name        = "kube-proxy"
  resolve_conflicts = "OVERWRITE"
}
resource "aws_eks_addon" "vpc-cni" {
  cluster_name      = local.cluster_name
  addon_name        = "vpc-cni"
  resolve_conflicts = "OVERWRITE"
}
# resource "aws_eks_addon" "coredns" {
#   cluster_name      = local.cluster_name
#   addon_name        = "coredns"
#   resolve_conflicts = "OVERWRITE"
# }
