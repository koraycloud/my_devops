terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

variable "ec2-name" {
  description = "ec2 tags : Name: Terraform First Instance Name: Terraform Second Instance"
  default     = ["Terraform First Instance", "Terraform Second Instance"]
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_security_group" "server-sg" {
  name = "WebServerSecurityGroup"
  tags = {
    "Name" = "TF_WebServerSecurityGroup"
  }
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "tf-instances" {
  ami             = data.aws_ami.amazon-linux-2.id
  instance_type   = "t2.micro"
  count           = 2
  key_name        = "firstkey"
  security_groups = ["WebServerSecurityGroup"]
  tags = {
    Name = element(var.ec2-name, count.index)
  }
  user_data = filebase64("user-data.sh")

  provisioner "local-exec" {
    command = "echo http://${self.public_ip} > public.txt"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private.txt"
  }
}


output "publicip" {
  value = aws_instance.tf-instances[*].public_ip

}
