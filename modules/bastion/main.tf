resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  instance_type               = var.bastion_instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.bastion_security_gorup.id]
  associate_public_ip_address = true
  key_name      = data.aws_key_pair.manual.key_name

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y htop net-tools telnet curl wget
    
    # Create a welcome message
    echo "Bastion host ready for debugging!" > /home/ec2-user/welcome.txt
  EOF

  tags = {
    Name = var.bastion_tags.name,
    Description = var.bastion_tags.description
  }
}

data "aws_key_pair" "manual" {
  key_name = "demo-pem-key"
}