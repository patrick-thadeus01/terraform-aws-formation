# provider "aws" {
#   region = "eu-north-1"
# }

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

# resource "aws_instance" "mon_serveur" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"

#   tags = {
#     Name = "Mon premier serveur"
#   }
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
  bucket = "formation-thadeus-terraform-tfstate-2026"
  key    = "module2/terraform.tfstate"
  region = "eu-north-1"
  dynamodb_table = "terraform-locks"
  encrypt = true
}

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "Mon_premier_bucket" {
  bucket = "terraform-tfstate-thadeus-2027"
  #acl    = "private"

  tags = {
    Name        = "Mon premier bucket"
    Environment = "Learning"
  }
}