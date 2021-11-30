#BACKEND configuration

terraform {
  backend "s3" {
    bucket = "talent-academy-lambda-exercise"
    key    = ".tfstates"
    dynamodb_table = "terraform-lock"
  }
}

