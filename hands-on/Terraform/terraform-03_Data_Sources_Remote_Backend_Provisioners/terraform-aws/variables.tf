variable "ec2_name" {
  default = "seryum-ec2"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_ami" {
  default = "ami-0ed9277fb7eb570c9"
}

variable "s3_bucket_name" {
  default = "seryum-tf-test"
}

variable "num_of_buckets" {
  default = 0
}

variable "users" {
  default = ["santino", "michael", "fredo"]
}