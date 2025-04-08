terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.87.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

locals { # asi podemos declarar variables locales solo en el scope de nuestro archivo
  lab_tag = "nginx server lab"
}

resource "aws_instance" "nginx-server" {
  ami           = "ami-0440d3b780d96b29d" # Amazon Linux 2023 AMI // us-east-1
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

  key_name = aws_key_pair.nginx-server-ssh.key_name

  vpc_security_group_ids = [aws_security_group.nginx-server-sg.id]

  tags = {
    LabTag = local.lab_tag
    Name   = "EC2_nginx_server"
  }
}

resource "aws_key_pair" "nginx-server-ssh" {
  key_name   = "nginx-server-ssh"
  public_key = file("./nginx-server.key.pub")
}

resource "aws_security_group" "nginx-server-sg" {
  name        = "nginx-server-sg"
  description = "Security group allowing SSH and HTTP access"

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

  egress { # All Ports
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_cloudwatch_log_group" "ec2_log_group" {
  tags = {
    Environment = "nginx server"
    Service     = replace(aws_instance.nginx-server.tags.Name, "EC2_", "")
  }
  lifecycle {
    create_before_destroy = true
  }
}
