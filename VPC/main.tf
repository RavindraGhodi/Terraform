terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.9.0"
    }
  }
required_version = "1.5.4"
}

provider "aws" {
    region = "us-east-1"
    access_key = "AKIAUUXJKYXWWSEFJG5Y"
    secret_key = "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"
}

# variables 

variable vpc_cidr_block {}
variable subnet_cidr_block {}
variable availability_zone {}
variable env_prefix  {}

resource "aws_vpc" "myapp-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
      name = "${var.env_prefix}-vpc"
    }
  
}

resource "aws_subnet" "myapp-subnet-1" {
    vpc_id = "aws_vpc.myapp-vpc.id" 
    cidr_block = var.subnet_cidr_block 
    availability_zone = var.availability_zone
    tags = {
        name = "${var.env_prefix}-subnet-1" 
   }
  
}