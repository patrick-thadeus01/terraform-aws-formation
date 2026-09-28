#La porte vers internet

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Internet Gateway"
  }
}

#Creation de la table de routage pour le sous-réseau public(le GPS de la ville)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0" #Ici on dit que pour aller vers n'importe quelle destination, il faut passer par la porte d'internet
    gateway_id = aws_internet_gateway.igw.id
  }
  
  tags = {
    Name = "Public-RouteTable"
  }
}

#Association de la table de routage avec le sous-réseau public
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}