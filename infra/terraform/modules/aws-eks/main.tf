variable "region"       { type = string }
variable "cluster_name" { type = string }
variable "vpc_id"       { type = string }
variable "subnet_ids"   { type = list(string) }
variable "node_min"     { type = number }
variable "node_max"     { type = number }
variable "env"          { type = string }

resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  version  = "1.29"
  role_arn = aws_iam_role.cluster.arn
  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = false
  }
  encryption_config {
    provider { key_arn = aws_kms_key.eks.arn }
    resources = ["secrets"]
  }
  tags = { env = var.env }
}

resource "aws_kms_key" "eks" {
  description             = "EKS secrets encryption — ${var.cluster_name}"
  enable_key_rotation     = true
  deletion_window_in_days = 30
}

resource "aws_iam_role" "cluster" {
  name = "${var.cluster_name}-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{ Effect = "Allow", Principal = { Service = "eks.amazonaws.com" }, Action = "sts:AssumeRole" }]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_policy" {
  role       = aws_iam_role.cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "default"
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.subnet_ids
  scaling_config  { desired_size = var.node_min, max_size = var.node_max, min_size = var.node_min }
  instance_types  = ["m6i.xlarge"]
}

resource "aws_iam_role" "node" {
  name = "${var.cluster_name}-node-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{ Effect = "Allow", Principal = { Service = "ec2.amazonaws.com" }, Action = "sts:AssumeRole" }]
  })
}

output "cluster_endpoint" { value = aws_eks_cluster.this.endpoint }
output "cluster_name"     { value = aws_eks_cluster.this.name }
