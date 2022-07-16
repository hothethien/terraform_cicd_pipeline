provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  cloud {
    organization = "job_16072022"

    workspaces {
      name = "remote_backend"
    }
  }
}   

locals {
  project = "terraform-series"
}

data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

#   owners = ["099720109477"]
}

resource "aws_instance" "ansible_server" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}