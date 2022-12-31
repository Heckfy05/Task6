#Creating a public key for instance using the variable
resource "aws_key_pair" "Frnkfurt" {
  key_name   = "Frnakfurt"
  public_key = file(var.public_key_path)
}

#Creating an instance for Grafana
resource "aws_instance" "Task6_AWS" {
  ami                    = "ami-06ce824c157700cd2"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_80.id]
  key_name               = aws_key_pair.Frnkfurt.key_name
  user_data              = file(var.Grafana) #variable for launching bash script for installing Grafana
  tags = {
    Name = "Task6"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = var.public_key_path
    timeout     = "4m"
  }
}

#Creating a security group and specifying the inbound port
resource "aws_security_group" "allow_80" {
  name        = "allow_80"
  description = "Allow 80 inbound traffic"

  ingress {
    description = "80 from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80"
  }
}