# VARIABLE DEFINITIONS

variable "aws_region" {
    default = "eu-west-1"
}

variable "pets_bucket_name" {
    description = "This stores the name for the bucketwhere the pets' info is stored"
    type = string
}
