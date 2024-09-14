provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "bhaskar_SG" {
  name        = "bhaskar_SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0fdf8c698a4cb9f8e"

  tags = {
    Name = "dev_env"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.bhaskar_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.bhaskar_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
