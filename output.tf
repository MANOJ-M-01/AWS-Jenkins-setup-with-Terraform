output "vpc_id" {
  description = "ID of the main VPC"
  value       = aws_vpc.main_network.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

output "public_instance_id" {
  description = "ID of the public instance"
  value       = aws_instance.public_instance.id
}

output "public_instance_ip" {
  description = "Public IP address of the public instance"
  value       = aws_instance.public_instance.public_ip
}

# Jenkins Setup
output "jenkins_instance_ip" {
  description = "The public IP of the Jenkins instance."
  value       = aws_instance.jenkins.public_ip
}
