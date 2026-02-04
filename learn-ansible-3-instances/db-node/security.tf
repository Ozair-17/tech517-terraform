resource "aws_security_group" "db_node_sg" {
  name        = "tech517-ozair-db-node-sg"
  description = "Allow SSH and MongoDB"
  vpc_id     = data.aws_vpc.default.id

  tags = {
    Name = "tech517-ozair-db-node-sg"
  }
}

# SSH (you only)
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.db_node_sg.id

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  cidr_ipv4  = "145.40.129.215/32"
}

# MongoDB (open for now — can restrict later to app-node SG)
resource "aws_vpc_security_group_ingress_rule" "mongodb" {
  security_group_id = aws_security_group.db_node_sg.id

  from_port   = var.mongodb_port
  to_port     = var.mongodb_port
  ip_protocol = "tcp"
  cidr_ipv4  = "0.0.0.0/0"
}

# Egress (allow all outbound)
resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.db_node_sg.id

  ip_protocol = "-1"
  cidr_ipv4  = "0.0.0.0/0"
}
