resource "aws_vpc" "main" {
  cidr_block            = var.vpc_cidr
  enable_dns_support    = true
  enable_dns_hostnames  = true
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  count             = 3
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "ecs-private-subnet"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  count                   = 3
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 3 + count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "ecs-public-subnet"
  }
}
