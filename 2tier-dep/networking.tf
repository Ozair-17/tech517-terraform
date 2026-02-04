# VPC

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tech517-ozair-vpc"
  }
}


# Internet Gateway

resource "aws_internet_gateway" "igw" {

    vpc_id = aws_vpc.main.id
  
}

# Public Subnet

resource "aws_subnet" "public" {

    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true

    tags = {
      Name = "Public Subnet"
    }
  
}

# Private Subnet

resource "aws_subnet" "Private" {

    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = false

    tags = {
      Name = "private Subnet"
    }
  
}

# Public Route Table

resource "aws_route_table" "public_rt" {

    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
      Name = "public-rt"
    }
  
}

# Attach public route table to Public Subnet
resource "aws_route_table_association" "public_assoc" {

    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_rt.id
  
}