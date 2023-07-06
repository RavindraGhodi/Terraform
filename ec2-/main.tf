
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"  # Replace with your desired AWS region
}

resource "aws_instance" "ec2_instance" {
  count         = 5
  ami           = "ami-0c94855ba95c71c99"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  
  # Replace with your desired key pair name
  key_name      = "your-key-pair-name"
  
  # Replace with your desired security group IDs
  security_group_ids = ["sg-0123456789abcdef0", "sg-0123456789abcdef1"]

  tags = {
    Name = "EC2Instance-${count.index}"
  }
}


Make sure to replace the following values with your own configurations:

- Replace `"us-west-2"` with your desired AWS region.
- Replace `"ami-0c94855ba95c71c99"` with the AMI ID you want to use.
- Replace `"your-key-pair-name"` with the name of your key pair.
- Replace `["sg-0123456789abcdef0", "sg-0123456789abcdef1"]` with the security group IDs you want to associate with the instances.

Note: Ensure that you have the appropriate AWS credentials set up for Terraform to authenticate and access your AWS account.