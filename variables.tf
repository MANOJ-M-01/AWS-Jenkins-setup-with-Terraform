variable "vpc_name" {
  description = "Value of the name for the VPC"
  type        = string
  default     = "main_network"
}

variable "vpc_cidr" {
  description = "Value of the CIDR range for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_name" {
  description = "Value of the Public Subnet Name for the VPC"
  type        = string
  default     = "public_subnet"
}

variable "public_subnet_cidr" {
  description = "Value of the Subnet CIDR range for the VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "igw_name" {
  description = "Value of the Internet Gateway for the VPC"
  type        = string
  default     = "main_network_igw"
}

variable "public_route_table_name" {
  description = "Value of the Public Route table Name for the VPC"
  type        = string
  default     = "public_rt"
}

variable "public_route_table_cidr" {
  description = "Value of the Public Route table CIDR rage for the VPC"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_security_group_name" {
  description = "Value of the Public Security Group Name"
  type        = string
  default     = "public_sg"
}

variable "ec2_ami" {
  description = "Value of the AMI id for the EC2 Instance"
  type        = string
  default     = "ami-04a81a99f5ec58529"
}

variable "ec2_type" {
  description = "Value of Instance Type for the EC2 Instance"
  type        = string
  default     = "t2.micro"
}

variable "public_ec2_name" {
  description = "Value of the Name for the Public EC2 Instance"
  type        = string
  default     = "public_instance"
}

variable "ssh_key_name" {
  description = "Value of the SSH Key Pair Name for the EC2 Instance"
  type        = string
  default     = "my_public_key"
}

# Jenkins Setup

variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "us-west-2"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance."
  default     = "ami-04a81a99f5ec58529" # Update this as per your region
}

variable "instance_type" {
  description = "The instance type to use for the instance."
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair."
  default     = "my_public_key"
}
