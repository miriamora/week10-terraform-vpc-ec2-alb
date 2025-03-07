resource "aws_instance" "server1" {
  ami                    = "ami-02d7fd1c2af6eead0"
  instance_type          = var.INSTANCE_TYPE
  availability_zone      = "${var.REGION}a"
  subnet_id              = aws_subnet.Private1.id
  vpc_security_group_ids = [aws_security_group.sg1.id]
  user_data              = file("code.sh")
  tags = {
    Name = var.ENVIRONMENT

  }

}

resource "aws_instance" "server2" {
  ami                    = "ami-02d7fd1c2af6eead0"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  subnet_id              = aws_subnet.Private2.id
  vpc_security_group_ids = [aws_security_group.sg1.id]
  user_data              = file("code.sh")
  tags = {
    Name = "Webserver-2"
  }

}