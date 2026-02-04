resource "aws_instance" "app" {
  ami           = var.app_ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public.id

  associate_public_ip_address = true
  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  user_data = templatefile("user_data.sh", {
    DB_IP = aws_instance.db.private_ip
  })

  tags = {
    Name = "tech517-ozair-app"
    Env  = "Testing"
  }
}
