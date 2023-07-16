terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-064ff912f78e3e561"
  instance_type = "t2.micro"

  tags = {
    Name = "Ravindra_ghodi2"
  }
}
# to see public ip
output "ec2_public_ips" {
        value = aws_instance.app_server.public_ip
}
# to see private ip
output "ec2_private_ips" {
        value = aws_instance.app_server.private_ip
}
