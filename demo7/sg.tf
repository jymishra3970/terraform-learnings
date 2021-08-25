resource "aws_security_group" "sg-jr" {
  vpc_id      = aws_vpc.vpc-jr.id
  name        = "allow-ssh"
  description = "security group that allows ssh"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.37.46.202/32"]
  }
  tags = {
    Name = " allow-ssh"
  }
}