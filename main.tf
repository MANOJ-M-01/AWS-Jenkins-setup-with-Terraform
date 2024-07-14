provider "aws" {
  profile = "manoj_admin"
  region  = "us-east-1"
}

# Create VPC
resource "aws_vpc" "main_network" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_network.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_name
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_network.id
  tags = {
    Name = var.igw_name
  }
}

# Create Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_network.id
  route {
    cidr_block = var.public_route_table_cidr
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.public_route_table_name
  }
}

# Associate Public Route Table with Public Subnet
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Create Public http and https Security Group
resource "aws_security_group" "public_sg" {
  vpc_id      = aws_vpc.main_network.id
  name        = var.public_security_group_name
  description = "Allow HTTP and HTTPS outbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.public_security_group_name
  }
}

# Create Public EC2 Instance
resource "aws_instance" "public_instance" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  key_name                    = var.ssh_key_name
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y nginx
              sudo systemctl restart nginx
              EOF

  tags = {
    Name = var.public_ec2_name
  }
}