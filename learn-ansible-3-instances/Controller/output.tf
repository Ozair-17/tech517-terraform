output "controller_public_ip" {
  description = "Public IP of Ansible Controller"
  value       = aws_instance.controller.public_ip
}

output "ssh_command" {
  value = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.controller.public_ip}"
}
