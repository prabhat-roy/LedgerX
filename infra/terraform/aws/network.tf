# Multi-region VPC + Transit Gateway (active-active).
module "vpc_use1" {
  source = "../modules/aws-vpc"
  providers = { aws = aws.use1 }
  region   = "us-east-1"
  cidr     = var.vpc_cidrs["us-east-1"]
  env      = var.env
}

module "vpc_euw1" {
  source = "../modules/aws-vpc"
  providers = { aws = aws.euw1 }
  region   = "eu-west-1"
  cidr     = var.vpc_cidrs["eu-west-1"]
  env      = var.env
}

module "vpc_aps1" {
  source = "../modules/aws-vpc"
  providers = { aws = aws.aps1 }
  region   = "ap-south-1"
  cidr     = var.vpc_cidrs["ap-south-1"]
  env      = var.env
}

# Transit Gateway peering across regions for inter-cluster traffic.
resource "aws_ec2_transit_gateway" "use1" {
  provider                       = aws.use1
  description                    = "ledgerx-tgw-use1"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  tags = { Name = "ledgerx-tgw-use1", env = var.env }
}

resource "aws_ec2_transit_gateway" "euw1" {
  provider    = aws.euw1
  description = "ledgerx-tgw-euw1"
  tags        = { Name = "ledgerx-tgw-euw1", env = var.env }
}

resource "aws_ec2_transit_gateway" "aps1" {
  provider    = aws.aps1
  description = "ledgerx-tgw-aps1"
  tags        = { Name = "ledgerx-tgw-aps1", env = var.env }
}

resource "aws_ec2_transit_gateway_peering_attachment" "use1_euw1" {
  provider                = aws.use1
  peer_account_id         = data.aws_caller_identity.current.account_id
  peer_region             = "eu-west-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.euw1.id
  transit_gateway_id      = aws_ec2_transit_gateway.use1.id
  tags = { Name = "tgw-peer-use1-euw1" }
}

resource "aws_ec2_transit_gateway_peering_attachment" "use1_aps1" {
  provider                = aws.use1
  peer_account_id         = data.aws_caller_identity.current.account_id
  peer_region             = "ap-south-1"
  peer_transit_gateway_id = aws_ec2_transit_gateway.aps1.id
  transit_gateway_id      = aws_ec2_transit_gateway.use1.id
  tags = { Name = "tgw-peer-use1-aps1" }
}

data "aws_caller_identity" "current" { provider = aws.use1 }
