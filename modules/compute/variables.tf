variable "ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where the EC2 instance will be deployed"
}

variable "key_name" {
  type        = string
  description = "Name of the key pair"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}