#Output of public IP from the created instance
output "PublicIp" {
  value = aws_instance.Task6_AWS.public_ip
}