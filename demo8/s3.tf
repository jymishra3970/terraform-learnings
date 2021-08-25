module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "my-terraform-bucket-jyomishra"
  acl    = "private"
  versioning = {
    enabled = true
  }
}