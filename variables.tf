variable "region" {
    description = "Region where AWS resources will be created"
    type = string
    default = "eu-north-1"
}

variable "environment" {
    description = "Environment (learning, dev, staging, prod)"
    type = string
    default = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block pour le vpc"
  type = string
  default = "10.0.0.0/16"
}