resource "aws_security_group" "app_node_sg" {
  name        = "tech517-ozair-app-node-sg"
  description = "Allow SSH, HTTP, and Node.js"
  vpc_id     = data.aws_vpc.default.id

  tags = {
    Name = "tech517-ozair-app-node-sg"
  }
}

# SSH (you only)
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.app_node_sg.id

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  cidr_ipv4  = "145.40.129.215/32"
}

# HTTP (80)
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.app_node_sg.id

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  cidr_ipv4  = "0.0.0.0/0"
}

# Node.js App (3000)
resource "aws_vpc_security_group_ingress_rule" "node" {
  security_group_id = aws_security_group.app_node_sg.id

  from_port   = 3000
  to_port     = 3000
  ip_protocol = "tcp"
  cidr_ipv4  = "0.0.0.0/0"
}

# Egress (allow all outbound)
resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.app_node_sg.id

  ip_protocol = "-1"
  cidr_ipv4  = "0.0.0.0/0"
}
