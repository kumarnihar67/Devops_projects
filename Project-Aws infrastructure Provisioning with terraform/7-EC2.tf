resource "aws_instance" "web" {
  ami                         = "ami-0144277607031eca2"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.publicsubnet.id
  vpc_security_group_ids      = [aws_security_group.ssh-sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_pair_name

  tags = {
    Name = "MyProjectEC2"
  }
}
