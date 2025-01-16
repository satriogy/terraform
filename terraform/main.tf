# Konfigurasi provider
provider "aws" {
  region = "ap-southeast-1" # Ubah sesuai kebutuhan
}

# Resource untuk membuat instance
resource "aws_instance" "aws_testing" {
  ami           = "ami-0e48a8a6b7dc1d30b" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Server"
  }

  # Konfigurasi block untuk security group
  vpc_security_group_ids = [aws_security_group.instance-sg.id]

  # Opsi key pair untuk akses SSH
  key_name = "aws_compute" # Ganti dengan key pair yang sudah ada

   # Disk konfigurasi
  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }
}

# Security group untuk instance
resource "aws_security_group" "instance-sg" {
  name_prefix = "example-instance-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
