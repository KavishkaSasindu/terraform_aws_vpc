
#public subnets route table
resource "aws_route_table_association" "public_sub_1" {
  subnet_id      = aws_subnet.public_sub_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_sub_2" {
  subnet_id      = aws_subnet.public_sub_2.id
  route_table_id = aws_route_table.public_route_table.id
}


#private subnets route tble
resource "aws_route_table_association" "private_sub_1" {
  subnet_id      = aws_subnet.private_sub_1.id
  route_table_id = aws_route_table.private_route_table.id
}
