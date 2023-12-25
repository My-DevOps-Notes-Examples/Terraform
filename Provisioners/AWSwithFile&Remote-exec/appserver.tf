resource "aws_security_group" "appserver_sg" {
  name        = var.server_security_group.name
  description = var.server_security_group.description
  vpc_id      = aws_vpc.appserver-vpc.id
  ingress {
    from_port   = var.server_security_group.port_80
    to_port     = var.server_security_group.port_80
    protocol    = var.server_security_group.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.server_security_group.port_22
    to_port     = var.server_security_group.port_22
    protocol    = var.server_security_group.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.server_security_group.name
  }

  depends_on = [
    aws_vpc.appserver-vpc
  ]
}

resource "aws_instance" "apache_server" {
  ami                         = data.aws_ami_ids.ubuntu_2204.ids[0]
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = "terraform"
  vpc_security_group_ids      = [aws_security_group.appserver_sg.id]
  subnet_id                   = data.aws_subnet.apache_server_subnet.id

  tags = {
    Name = "apache-server"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/nagas/Downloads/terraform.pem")
    host        = self.public_ip # self is used within the resource
  }

  provisioner "remote-exec" {
    inline = [ "sudo apt update", "sudo apt install apache2 -y" ]
  }
}