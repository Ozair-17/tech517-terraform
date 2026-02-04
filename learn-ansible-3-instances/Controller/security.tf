resource "aws_security_group" "controller_sg" {
  name        = "tech517-ozair-controller-sg"
  description = "Allow SSH only from my IP"
  vpc_id     = data.aws_vpc.default.id

  tags = {
    Name = "tech517-ozair-controller-sg"
  }
}

# SSH access
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.controller_sg.id

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  cidr_ipv4  = "145.40.129.215/32"
}

# Egress - allow all outbound
resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.controller_sg.id

  ip_protocol = "-1"
  cidr_ipv4  = "0.0.0.0/0"
}
