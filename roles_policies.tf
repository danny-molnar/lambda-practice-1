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
resource "aws_iam_policy" "lambda_cw_access_policy" {
  name = "lambda_cw_access"
  path = "/"
  description = "This policy will allow the lambda function to access CloudWatch logs"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "cwlogaccess"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "*" # allowing all CloudWatch Log resources
      },
      {
        "Sid" : "s3List",
        "Action" : [
          "s3:List*"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      },
      {
        "Sid" : "s3access",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject",
        ],
        "Effect" : "Allow",
        "Resource" : [
          "arn:aws:s3:::${var.pets_bucket_name}", # allowing the bucket ITSELF to be accessed
          "arn:aws:s3:::${var.pets_bucket_name}/*" # wildcard denoting everything in bucket will be accessed
        ]
      }
    ]
  })
}

# Attaching the policy to the role
resource "aws_iam_role_policy_attachment" "lambda-role-policy-attachment" {
  role = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_cw_access_policy.arn
}

