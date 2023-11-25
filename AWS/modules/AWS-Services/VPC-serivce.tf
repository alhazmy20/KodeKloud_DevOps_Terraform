
resource "aws_vpc" "create_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MyVPC"
  }
  enable_dns_hostnames = true
}

resource "aws_subnet" "public_subnet_az1" {
  vpc_id = aws_vpc.create_vpc.id
  availability_zone = var.az1_name
  cidr_block        = "10.0.4.0/22"
  tags = {
    Name = "Pbulic-1A"
  }
  map_public_ip_on_launch = true
  depends_on              = [aws_vpc.create_vpc]
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id = aws_vpc.create_vpc.id
  availability_zone = var.az2_name
  cidr_block        = "10.0.8.0/22"
  tags = {
    Name = "Public-1B"
  }
  map_public_ip_on_launch = true
  depends_on              = [aws_vpc.create_vpc]

}

resource "aws_subnet" "private_subnet_az1" {
  vpc_id            = aws_vpc.create_vpc.id
  availability_zone = var.az1_name
  cidr_block        = "10.0.12.0/22"
  tags = {
    Name = "Private-1A"
  }
  depends_on = [aws_vpc.create_vpc]
}

resource "aws_subnet" "private_subnet_az2" {
  vpc_id            = aws_vpc.create_vpc.id
  availability_zone = var.az2_name
  cidr_block        = "10.0.16.0/22"
  tags = {
    Name = "Private-2B"
  }
  depends_on = [aws_vpc.create_vpc]

}

resource "aws_internet_gateway" "create_vpc_igw" {
  vpc_id = aws_vpc.create_vpc.id
  tags = {
    Name = "VPC-IGW"
  }
  depends_on = [aws_vpc.create_vpc]
}

resource "aws_route_table" "create_private_route_table" {
  vpc_id = aws_vpc.create_vpc.id
  tags = {
    Name = "Private-RT"
  }
  depends_on = [aws_vpc.create_vpc]
}
resource "aws_route" "public_gatway_route" {
  route_table_id         = aws_vpc.create_vpc.main_route_table_id
  gateway_id             = aws_internet_gateway.create_vpc_igw.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = [aws_vpc.create_vpc, aws_internet_gateway.create_vpc_igw]

}

resource "aws_route_table_association" "associate_private_subnet_az1" {
  route_table_id = aws_route_table.create_private_route_table.id
  subnet_id      = aws_subnet.private_subnet_az1.id
  depends_on     = [aws_route_table.create_private_route_table, aws_subnet.private_subnet_az1]

}

resource "aws_route_table_association" "associate_private_subnet_az2" {
  route_table_id = aws_route_table.create_private_route_table.id
  subnet_id      = aws_subnet.private_subnet_az2.id
  depends_on     = [aws_route_table.create_private_route_table, aws_subnet.private_subnet_az2]

}

resource "aws_nat_gateway" "create_nat_gateway" {
  subnet_id = aws_subnet.private_subnet_az1.id
  tags = {
    Name = "Private-1A_NAT_GATEWAY"
  }
  connectivity_type = "public"
  allocation_id     = aws_eip.create_eip_for_nat.id
  depends_on        = [aws_subnet.public_subnet_az1, aws_eip.create_eip_for_nat]
}

resource "aws_eip" "create_eip_for_nat" {
  depends_on = [aws_vpc.create_vpc]
}

resource "aws_route" "add_route_for_nat" {
  route_table_id         = aws_route_table.create_private_route_table.id
  nat_gateway_id         = aws_nat_gateway.create_nat_gateway.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = [aws_route_table.create_private_route_table, aws_nat_gateway.create_nat_gateway]
}
