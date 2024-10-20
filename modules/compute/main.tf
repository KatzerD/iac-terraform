resource "aws_instance" "my_ec2" {
  ami                    = var.ami
  instance_type         = var.instance_type
  subnet_id             = var.subnet_id
  key_name              = var.key_name

  associate_public_ip_address = true

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "My EC2 Instance"
  }
}

resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2 Security Group"
  }
}
