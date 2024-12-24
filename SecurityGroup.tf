
#public_ec2 security group
resource "aws_security_group" "test_sg" {
  name        = "test_sg"
  description = "security group for public instance"
  vpc_id      = aws_vpc.test_vpc.id

  tags = {
    Name = "test_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allo_ssh" {
  security_group_id = aws_security_group.test_sg.id
  cidr_ipv4         = "203.189.184.113/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.test_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "allow_http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp" {
  security_group_id = aws_security_group.test_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1 # ICMP type (-1 allows all types)
  to_port           = -1 # ICMP code (-1 allows all codes)
  ip_protocol       = "icmp"
}

resource "aws_vpc_security_group_egress_rule" "allo_outbound_traffic" {
  security_group_id = aws_security_group.test_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name = "allow_outbound_traffic"
  }
}


#bastion security group
resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "security group for bastion instance"
  vpc_id      = aws_vpc.test_vpc.id

  tags = {
    Name = "bastion_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.bastion_sg.id
  cidr_ipv4         = "203.189.184.113/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "allow_ssh"
  }

}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_traffic" {
  security_group_id = aws_security_group.bastion_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


#private security security group
resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "security group for private instance"
  vpc_id      = aws_vpc.test_vpc.id

  tags = {
    Name = "private_sg"
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type                     = "ingress"
  security_group_id        = aws_security_group.private_sg.id
  source_security_group_id = aws_security_group.bastion_sg.id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}


resource "aws_vpc_security_group_egress_rule" "allow_outbound" {
  security_group_id = aws_security_group.private_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
