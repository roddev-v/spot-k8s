output "main_vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "main_vpc_cidr" {
  value = aws_vpc.main_vpc.cidr_block
}

output "public_subnet_0_id" {
  value = aws_subnet.public_subnet_0.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "private_subner_id" {
  value = aws_subnet.private_subnet.id
}
