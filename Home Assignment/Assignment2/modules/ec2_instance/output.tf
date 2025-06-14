output "id" {
    description = "EC2 instance IDs"
    value       = aws_instance.priyesh-webapplication[*].id
}

output "public_ip" {
    description = "Public IPs of EC2 instances"
    value       = aws_instance.priyesh-webapplication[*].public_ip
}
