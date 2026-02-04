resource "aws_security_group" "db_sg" {
  name        = "tech517-ozair-db-sg"
  description = "Allow MongoDB only from App VM"
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "tech517-ozair-db-sg"
  }
}

# SSH
resource "aws_vpc_security_group_ingress_rule" "db_ssh" {
  security_group_id = aws_security_group.db_sg.id

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  cidr_ipv4  = "localIp"
}

# MongoDB - ONLY from App SG
resource "aws_vpc_security_group_ingress_rule" "db_mongo" {
  security_group_id = aws_security_group.db_sg.id

  from_port       = var.mongodb_port
  to_port         = var.mongodb_port
  ip_protocol     = "tcp"
  cidr_ipv4       = "10.0.2.0/24"
}

# Egress
resource "aws_vpc_security_group_egress_rule" "db_egress" {
  security_group_id = aws_security_group.db_sg.id
  ip_protocol      = "-1"
  cidr_ipv4       = "0.0.0.0/0"
}
