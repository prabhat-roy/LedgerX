# Three EKS clusters — one per region, active-active.
module "eks_use1" {
  source     = "../modules/aws-eks"
  providers  = { aws = aws.use1 }
  region     = "us-east-1"
  cluster_name = "ledgerx-use1"
  vpc_id     = module.vpc_use1.vpc_id
  subnet_ids = module.vpc_use1.private_subnet_ids
  node_min   = var.eks_node_min
  node_max   = var.eks_node_max
  env        = var.env
}

module "eks_euw1" {
  source       = "../modules/aws-eks"
  providers    = { aws = aws.euw1 }
  region       = "eu-west-1"
  cluster_name = "ledgerx-euw1"
  vpc_id       = module.vpc_euw1.vpc_id
  subnet_ids   = module.vpc_euw1.private_subnet_ids
  node_min     = var.eks_node_min
  node_max     = var.eks_node_max
  env          = var.env
}

module "eks_aps1" {
  source       = "../modules/aws-eks"
  providers    = { aws = aws.aps1 }
  region       = "ap-south-1"
  cluster_name = "ledgerx-aps1"
  vpc_id       = module.vpc_aps1.vpc_id
  subnet_ids   = module.vpc_aps1.private_subnet_ids
  node_min     = var.eks_node_min
  node_max     = var.eks_node_max
  env          = var.env
}
