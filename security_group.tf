# Groupe de sécurité
resource "aws_security_group" "web" {
  name        = "formation-web-sg"
  description = "Autoriser le trafic HTTP HTTPS et SSH"
  vpc_id      = aws_vpc.main.id

#Port 80 : pour que tout le monde puisse accéder à notre site web
  ingress {
    description = "HTTP depuis n-import ou"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#Port 22 : pour que tout le monde puisse se connecter en SSH à notre serveur web
  ingress {
    description = "SSH depuis n-importe ou"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["129.0.76.245/32"] 
 }
#Sortie : autoriser tout le trafic qui sort
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "formation-web-sg"
  }
}