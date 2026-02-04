resource "aws_instance" "app_node" {
  ami = data.aws_ami.ubuntu_2204.id

  instance_type = var.instance_type

  associate_public_ip_address = true
  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.app_node_sg.id
  ]

  tags = {
    Name = "tech517-ozair-ubuntu-2204-ansible-target-node-app"
    Role = "Ansible-Target-Node"
    Env  = "Training"
  }
}
