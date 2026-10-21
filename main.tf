terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-01a00762f46d584a1" // Example Ubuntu AMI
  instance_type = "t3.micro"

  tags = {
    Name = "Jenkins-Terraform-Instance"
  }
}
