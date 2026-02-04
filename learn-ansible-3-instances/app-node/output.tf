output "app_node_public_ip" {
  description = "Public IP of Ansible target node (App VM)"
  value       = aws_instance.app_node.public_ip
}

output "ssh_command" {
  value = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.app_node.public_ip}"
}
