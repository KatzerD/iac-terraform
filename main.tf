terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "backend-s3-enrique-cloud"  # Bucket gestionado por otro IoC
    key    = "terraform/state"
    region = "us-east-1"
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_key_pair" "my_key" {
  key_name   = "ansible_key"
  public_key = file("./.ssh/mi_clave_ssh.pub")
}

# Módulo para la red (VPC, Subnets, etc.)
module "network" {
  source            = "./modules/network"
  vpc_cidr_block    = "10.0.0.0/16"
  subnet_cidr_block = "10.0.1.0/24"
}

# Salida de la red
output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

# Módulo de computo (EC2 Instances)
module "compute" {
  source        = "./modules/compute"
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  subnet_id     = module.network.subnet_id
  key_name      = aws_key_pair.my_key.key_name
  vpc_id = module.network.vpc_id
  security_group_id = aws_security_group.ec2_sg.id
}

# Salida de las instancias de cómputo
output "instance_id" {
  value = module.compute.instance_id
}
output "ec2_public_ip" {
  value = module.compute.ec2_public_ip
}

# Módulo para la base de datos
module "database" {
  source            = "./modules/database"
  
  subnet_ids        = [module.network.private_subnet_id, module.network.private_subnet_2_id]  # Corrected subnet IDs
  allocated_storage = 20
  engine            = "postgres"
  instance_class    = "db.t4g.micro"
  db_name           = "mydatabase"
  db_username       = var.db_username
  db_password       = var.db_password
  security_group_id = aws_security_group.rds_sg.id
  parameter_group_name = "default.postgres16"
}

# Output de los detalles de la base de datos
output "rds_endpoint" {
  value = module.database.rds_endpoint
}

output "db_name" {
  value = module.database.db_name
}

resource "aws_security_group" "rds_sg" {
  vpc_id = module.network.vpc_id

  ingress {
    from_port   = 5432  # O 3306 para MySQL
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cidr_block]  # Solo permitir tráfico dentro de la VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS Security Group"
  }
}