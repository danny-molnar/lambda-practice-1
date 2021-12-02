# IAM roles and policies

# Resource for IAM role
resource "aws_iam_role" "lambda_role" {
  name = "var.lambda_role_name"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid = "assumerolelambda"
            Principal = {
                Service = "lambda.amazonaws.com"
            }
        }
    ]
  })

  tags = {
    "Name" = "var.lambda_role_name"
  }
}



# Resource for policy to allow the lambda to access CW logs
# TODO

# Attaching the policy to the role
# TODO

