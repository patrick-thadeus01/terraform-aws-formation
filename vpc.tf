#creation de la ville vpc
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "format-vpc"
  }
}

#creation du quartier public(accessible depuis internet)
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 1) #cette ligne permet de calculer le sous-réseau public à partir du cidr du vpc de facon automatique
  availability_zone = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

#creation du quartier privee (non accessible depuis internet)
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 2) #cette ligne permet de calculer le sous-réseau privé à partir du cidr du vpc de facon automatique
  availability_zone = "eu-north-1b"

  tags = {
    Name = "Private Subnet"
  }
}