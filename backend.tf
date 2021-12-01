#BACKEND configuration

terraform {
  backend "s3" {
    bucket = "talent-academy-lambda-exercise"
    key    = "talent-academy-834539731159-tfstates/sprint2/week3"
    dynamodb_table = "terraform-lock"
  }
}

