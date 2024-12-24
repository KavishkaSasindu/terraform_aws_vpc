#public ec2 instance
resource "aws_instance" "public_ec2_1" {
  ami             = var.AMI
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.public_ec2_key.key_name
  security_groups = [aws_security_group.test_sg.id]
  subnet_id       = aws_subnet.public_sub_1.id

  tags = {
    Name = "public_ec2_1"
  }
}


output "public_ec2_1" {
  value = aws_instance.public_ec2_1.public_ip
}

resource "aws_instance" "public_ec2_2" {
  ami             = var.AMI
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.public_ec2_key.key_name
  security_groups = [aws_security_group.test_sg.id]
  subnet_id       = aws_subnet.public_sub_2.id

  tags = {
    Name = "public_ec2_2"
  }
}

output "public_ec2_2" {
  value = aws_instance.public_ec2_2.public_ip
}

#bastion instance
resource "aws_instance" "bastion_ec2" {
  ami             = var.AMI
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.bastion_key.key_name
  security_groups = [aws_security_group.bastion_sg.id]
  subnet_id       = aws_subnet.public_sub_1.id

  tags = {
    Name = "bastion_ec2"
  }
}
output "bastion_public_ip" {
  value = aws_instance.bastion_ec2.public_ip

}

#private ec2 instance
resource "aws_instance" "private_ec2_1" {
  ami             = var.AMI
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.private_ec2.key_name
  security_groups = [aws_security_group.private_sg.id]
  subnet_id       = aws_subnet.private_sub_1.id

  tags = {
    Name = "private_ec2"
  }
}

