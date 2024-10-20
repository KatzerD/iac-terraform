# Grupo de subredes para RDS
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "DB Subnet Group"
  }
}

# Base de datos RDS (PostgreSQL o MySQL)
resource "aws_db_instance" "my_rds" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine  # PostgreSQL
  instance_class       = var.instance_class
  name = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot  = true

  parameter_group_name = var.parameter_group_name
}