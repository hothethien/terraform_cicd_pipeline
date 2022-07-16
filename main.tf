provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  cloud {
    organization = "job_16072022"

    workspaces {
      name = "terraform_cicd_pipeline"
    }
  }
}   

locals {
  project = "terraform-series"
}

# data "aws_ami" "ami" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

# #   owners = ["099720109477"]
# }

resource "aws_instance" "ansible_server" {
  ami           = "ami-02ee763250491e04a"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}