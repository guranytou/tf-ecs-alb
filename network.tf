# VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "example"
  }
}

# subnet
resource "aws_subnet" "public_subnet_1a" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_subnet_1a"
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "public_subnet_1c"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private_subnet_1a"
  }
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.1.2.0/24"

  tags = {
    Name = "private_subnet_1c"
  }
}

# IGW
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id

  tags = {
    "Name" = "example"
  }
}

# Route Table - Public
resource "aws_route_table" "example_internet_gw" {
  vpc_id = aws_vpc.example.id

  tags = {
    "Name" = "example_route_internet_gw"
  }
}

resource "aws_route" "example_internet_gw_default" {
  route_table_id         = aws_route_table.example_internet_gw.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.example.id
}

resource "aws_route_table_association" "example_internet_gw_1a" {
  subnet_id      = aws_subnet.example_public_1a.id
  route_table_id = aws_route_table.example_internet_gw.id
}

resource "aws_route_table_association" "example_internet_gw_1c" {
  subnet_id      = aws_subnet.example_public_1c.id
  route_table_id = aws_route_table.example_internet_gw.id
}