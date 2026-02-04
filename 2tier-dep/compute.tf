resource "aws_instance" "db" {
  ami           = var.db_ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.Private.id

  associate_public_ip_address = false
  key_name = var.key_name


  vpc_security_group_ids = [
    aws_security_group.db_sg.id
  ]

  tags = {
    Name = "tech517-ozair-db"
    Env  = "Testing"
  }
}
