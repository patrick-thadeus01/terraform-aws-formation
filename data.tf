# Data sources for AWS information
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

#afficher les resultats pour verifier que le data source fonctionne

output "latest_ami_id" {
    description = "ID de la derniere AMI Amazon Linux"
  value = data.aws_ami.amazon_linux.id
}