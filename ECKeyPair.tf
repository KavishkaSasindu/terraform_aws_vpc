resource "aws_key_pair" "public_ec2_key" {
  key_name   = "public_ec2_key"
  public_key = ""
}

resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion_key"
  public_key = ""
}

resource "aws_key_pair" "private_ec2" {
  key_name   = "private_ec2"
  public_key = ""
}
