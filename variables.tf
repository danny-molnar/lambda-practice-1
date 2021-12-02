# VARIABLE DEFINITIONS

variable "aws_region" {
    default = "eu-west-1"
}

variable "pets_bucket_name" {
    description = "This stores the name for the bucket with the pets' information"
    type = string
}

variable "lambda_role_name" {
    description = "This variable stores the name for the lambda IAM role"
    default = "lambda_petfood_assume_role"
}