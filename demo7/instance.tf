resource "aws_instance" "example" {
  ami                    = var.AMIS[var.AWS_REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public-jr-2.id
  vpc_security_group_ids = [aws_security_group.sg-jr.id]
  key_name               = aws_key_pair.mykeypair_jr.key_name
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-west-1b"
  size              = 20
  type              = "gp2"
  tags = {
    name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-attachement-1" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.example.id
}