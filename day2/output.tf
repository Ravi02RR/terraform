output "ec2_public_ip_adress" {
  value       = aws_instance.example.public_ip
  description = "this is the public ip address of the ec2 instance"
}

output "ec2_public_dns" {
  value       = aws_instance.example.public_dns
  description = "this is the public dns of the ec2 instance"
}
