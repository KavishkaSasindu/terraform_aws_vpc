#Purpose:create subnets for 2 availability zones

#availability zone 1 public and private subnet
resource "aws_subnet" "public_sub_1" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.AZ_1
  map_public_ip_on_launch = true

  tags = {
    Name = "public_sub_1"
  }
}

resource "aws_subnet" "private_sub_1" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.AZ_1

  tags = {
    Name = "private_sub_1"
  }
}

#availability zone 2 public and private subnet
resource "aws_subnet" "public_sub_2" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = var.AZ_2
  map_public_ip_on_launch = true

  tags = {
    Name = "public_sub_2"
  }
}
