resource "aws_vpc" "vpc-jr" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    name = "main"
  }
}

resource "aws_subnet" "public-jr-2" {
  vpc_id                  = aws_vpc.vpc-jr.id
  cidr_block              = "192.168.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1b"

  tags = {
    name = "public-subnet-jr2"
  }
}

resource "aws_subnet" "public-jr-3" {
  vpc_id                  = aws_vpc.vpc-jr.id
  cidr_block              = "192.168.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1c"

  tags = {
    name = "public-subnet-jr3"
  }
}

resource "aws_subnet" "private-jr-2" {
  vpc_id                  = aws_vpc.vpc-jr.id
  cidr_block              = "192.168.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-1b"

  tags = {
    name = "private-subnet-jr2"
  }
}

resource "aws_subnet" "private-jr-3" {
  vpc_id                  = aws_vpc.vpc-jr.id
  cidr_block              = "192.168.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-1c"

  tags = {
    name = "private-subnet-jr3"
  }
}
resource "aws_internet_gateway" "igw-jr" {
  vpc_id = aws_vpc.vpc-jr.id

  tags = {
    name = "igw-jr"
  }
}

resource "aws_route_table" "rt-public-jr" {
  vpc_id = aws_vpc.vpc-jr.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-jr.id
  }

}

resource "aws_route_table_association" "public-jr-2" {
  subnet_id      = aws_subnet.public-jr-2.id
  route_table_id = aws_route_table.rt-public-jr.id
}

resource "aws_route_table_association" "public-jr-3" {
  subnet_id      = aws_subnet.public-jr-3.id
  route_table_id = aws_route_table.rt-public-jr.id
}

