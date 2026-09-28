#Configuration de l'instance EC2 : notre serveur web
resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id
  #key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.web.id]

  #script qui sera exécuté lors du lancement de l'instance pour installer un serveur web
    user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
                sudo yum install -y httpd mariadb-server
                sudo systemctl start httpd
                sudo systemctl enable httpd
                echo "<h1>Bienvenue sur mon serveur web</h1>" | sudo tee /var/www/html/index.html
                EOF

  tags = {
    Name = "formation-web-instance"
  }
}

#Afficer les url du serveur web pour vérifier que l'instance est bien créée et accessible
output "web_uri" {
  description = "url du serveur web" #Au lieu de passer par une adresse IP, on peut passer par une url pour accéder à notre serveur web
  value       = "http://${aws_instance.web.public_ip}"
}