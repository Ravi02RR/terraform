# key pair 
resource "aws_key_pair" "deployer" {
  key_name   = "deployer_key"
  public_key = file("./deployer_key.pub")
}


#vpc and security group
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default"
  }
}

# security group for the instance
resource "aws_security_group" "instance_sg" {
  name        = "instance-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_default_vpc.default.id #interpolation

  tags = {
    Name = "allow_ttls"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#ec2 instance
resource "aws_instance" "example" {
  ami             = var.ec2_ami_id
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.instance_sg.name]
  instance_type   = var.ec2_instance_type
  tags = {
    Name = var.ec2_name
  }

  root_block_device {
    volume_type = "gp3"
    volume_size = var.ec2_root_storage_size

  }
}
