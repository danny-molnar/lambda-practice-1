# This contains the lambda function resource

resource "aws_lambda_function" "pets_lambda" {
  filename = data.archive_file.pets_script.output_path
  function_name = var.script_filename
  role = aws_iam_role.lambda_role.arn
  handler = "${var.script_filename}.pet_handler"

  source_code_hash = data.archive_file.pets_script.output_base64sha256

  runtime = "python3.8"
}