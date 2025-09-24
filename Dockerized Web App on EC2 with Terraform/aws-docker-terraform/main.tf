provider "aws" {
  region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = "docker-key"
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "web_sg" {
  name        = "allow-web"
  description = "Allow SSH and HTTP"
  ingress = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 5000
      to_port     = 5000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

resource "aws_instance" "docker_ec2" {
  ami             = "ami-0c2b8ca1dad447f8a" # Amazon Linux 2 AMI (Free Tier)
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.web_sg.name]

  user_data = file("install_docker.sh")

  tags = {
    Name = "DockerEC2"
  }
}
