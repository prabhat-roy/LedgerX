variable "region" { type = string }
variable "cidr"   { type = string }
variable "env"    { type = string }

resource "aws_vpc" "this" {
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = { Name = "ledgerx-vpc-${var.region}", env = var.env }
}

data "aws_availability_zones" "this" { state = "available" }

resource "aws_subnet" "private" {
  count             = 3
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr, 4, count.index)
  availability_zone = data.aws_availability_zones.this.names[count.index]
  tags = { Name = "ledgerx-priv-${var.region}-${count.index}", "kubernetes.io/role/internal-elb" = "1" }
}

resource "aws_subnet" "public" {
  count             = 3
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr, 4, count.index + 8)
  availability_zone = data.aws_availability_zones.this.names[count.index]
  map_public_ip_on_launch = true
  tags = { Name = "ledgerx-pub-${var.region}-${count.index}", "kubernetes.io/role/elb" = "1" }
}

output "vpc_id"             { value = aws_vpc.this.id }
output "private_subnet_ids" { value = aws_subnet.private[*].id }
output "public_subnet_ids"  { value = aws_subnet.public[*].id }
