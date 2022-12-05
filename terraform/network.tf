# Development VPC
resource "aws_vpc" "development-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Development VPC"
  }
}

# Public subnets
resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.development-vpc.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.development-vpc.id

  tags = {
    Name = "Project VPC IG"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.development-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_subnet_ass" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_db_subnet_group" "production" {
  name       = "main"
  subnet_ids = [aws_subnet.public_subnets[0].id, aws_subnet.public_subnets[1].id]

  tags = {
    Name = "My DB subnet group"
  }
}