resource "aws_key_pair" "mykeypair_jr" {
  key_name   = "mykeypair_jr"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}