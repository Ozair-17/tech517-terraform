output "app_public_ip" {
  description = "Public IP of App VM"
  value       = aws_instance.app.public_ip
}

output "db_public_ip" {
  description = "Public IP of DB VM"
  value       = aws_instance.db.public_ip
}

output "ssh_app" {
  value = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.app.public_ip}"
}

output "ssh_db" {
  value = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.db.public_ip}"
}
