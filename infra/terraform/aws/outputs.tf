output "eks_use1" { value = module.eks_use1.cluster_endpoint }
output "eks_euw1" { value = module.eks_euw1.cluster_endpoint }
output "eks_aps1" { value = module.eks_aps1.cluster_endpoint }
output "vpc_ids"  { value = { use1 = module.vpc_use1.vpc_id, euw1 = module.vpc_euw1.vpc_id, aps1 = module.vpc_aps1.vpc_id } }
output "kms_secrets_arn" { value = aws_kms_key.secrets.arn }
output "cloudhsm_use1_id" { value = aws_cloudhsm_v2_cluster.use1.cluster_id }
