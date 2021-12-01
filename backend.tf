#BACKEND configuration
#That is, the bucket and the folder structure(key-unique) in which I store the tfstates configuration

terraform {
  backend "s3" {
    bucket = "talent-academy-834539731159-tfstates"
    key    = "sprint2/week3"
    dynamodb_table = "terraform-lock"
  }
}

