terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.23.0"
    }
  }

  backend "s3" {
    bucket = "tf-remote-s3-bucket-koray-backend"
    key = "env/dev/tf-remote-backend.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt = true
  }
}

# provider "aws" {
#   region = "us-east-1"

# }

locals {
  mytag = "koray-local-name"
}

data "aws_ami" "tf_ami" {
  most_recent = true
  owners = ["self"]

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  
}

resource "aws_instance" "tf-ec2" {
  ami           = data.aws_ami.tf_ami.id
  instance_type = var.ec2_type
  key_name      = "firstkey"
  tags = {
    "Name" = "${local.mytag}-this is from my-ami"
  }
}


resource "aws_s3_bucket" "tf-s3" {
  # bucket = "${var.s3_bucket_name}-${count.index}"
  # count = var.num_of_buckets
  # count = var.num_of_buckets != 0 ? var.num_of_buckets : 3
  for_each = toset(var.users)
  bucket = "koray-tf-s3-bucket-${each.value}"
}

resource "aws_iam_user" "new_users" {
  for_each = toset(var.users)
  name = each.value
}

output "tf_example_public_ip" {
  value = aws_instance.tf-ec2.public_ip
}

output "uppercase_users" {
  value = [for user in var.users : upper(user) if length(user) > 6]
}


# output "tf_example_s3_meta" {
#   value = aws_s3_bucket.tf-s3[*]
# }

output "tf_example_private_ip" {
  value = aws_instance.tf-ec2.private_ip
}

output "s3-arn-1" {
  value = aws_s3_bucket.tf-s3["fredo"].arn
  }