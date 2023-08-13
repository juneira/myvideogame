data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "function_archive" {
  type        = "zip"
  source_file = "${path.module}/${var.source_file}"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.function_name
  role = aws_iam_role.iam_for_lambda.arn
  handler = var.source_file
  runtime = "go1.x"
  filename = "${path.module}/lambda.zip"

  source_code_hash = data.archive_file.function_archive.output_base64sha256
}

output "lambda_arn" {
  value = aws_lambda_function.lambda_function.arn

  depends_on = [ aws_lambda_function.lambda_function ]
}