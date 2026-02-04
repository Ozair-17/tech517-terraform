output "db_node_public_ip" {
  description = "Public IP of Ansible target node (DB VM)"
  value       = aws_instance.db_node.public_ip
}

output "ssh_command" {
  value = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.db_node.public_ip}"
}
