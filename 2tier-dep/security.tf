resource "aws_security_group" "app_sg" {
  name        = "tech517-ozair-app-sg"
  description = "Allow SSH, HTTP, Node.js"
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "tech517-ozair-app-sg"
  }
}

# SSH
resource "aws_vpc_security_group_ingress_rule" "app_ssh" {
  security_group_id = aws_security_group.app_sg.id

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  cidr_ipv4  = "145.40.129.215/32"
}

# HTTP
resource "aws_vpc_security_group_ingress_rule" "app_http" {
  security_group_id = aws_security_group.app_sg.id

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  cidr_ipv4  = "0.0.0.0/0"
}

# Node.js
resource "aws_vpc_security_group_ingress_rule" "app_node" {
  security_group_id = aws_security_group.app_sg.id

  from_port   = var.node_js_port
  to_port     = var.node_js_port
  ip_protocol = "tcp"
  cidr_ipv4  = "0.0.0.0/0"
}

# Egress
resource "aws_vpc_security_group_egress_rule" "app_egress" {
  security_group_id = aws_security_group.app_sg.id
  ip_protocol      = "-1"
  cidr_ipv4       = "0.0.0.0/0"
}
