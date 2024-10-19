output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_id" {
  value = aws_subnet.main_subnet.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main_gw.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main_vpc.cidr_block
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
}