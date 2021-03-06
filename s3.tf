# S3 bucket creation

resource "aws_s3_bucket" "my_pet_bucket" {
  bucket = var.pets_bucket_name

  versioning {
    enabled = true
  }

  tags = {
    Name        = var.pets_bucket_name
    Environment = "Test"
  }
}