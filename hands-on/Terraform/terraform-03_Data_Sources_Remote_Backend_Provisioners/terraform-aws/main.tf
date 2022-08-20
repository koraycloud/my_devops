terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.23.0"
    }
  }
  backend "s3" {
    bucket = "tf-remote-s3-bucket-seryum"
    key = "env/dev/tf-remote-backend.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt = true
  }
}

resource "aws_instance" "tf-ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = "firstkey"
  tags = {
    Name = "${var.ec2_name}-instance"
  }
}

output "tf-example-public_ip" {
  value = aws_instance.tf-ec2.public_ip
}

output "tf_example_private_ip" {
  value = aws_instance.tf-ec2.private_ip
}

