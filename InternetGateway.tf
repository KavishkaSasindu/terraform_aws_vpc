resource "aws_internet_gateway" "test_IGW" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    Name = "test_IGW"
  }
}
