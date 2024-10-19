variable "ami" {
  type = string
  description = "AMI ID for the EC2 instance"
  default = "ami-08c40ec9ead489470"  # Para us-east-1
}

variable "instance_type" {
    type = string
    description = "Type of EC2 instance"
    default = "t2.micro"  
}

variable "subnet_id" {
  type = string
  description = "Subnet ID where the EC2 instance will be deployed"
}