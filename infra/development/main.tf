module "olx_sqs" {
  source = "./sqs"

  sqs_name = "olx_sqs"
}

module "olx_sns" {
  source = "./sns"

  endpoint = module.olx_sqs.sqs_arn
  protocol = "sqs"
  sns_name = "olx_sns"
}

module "olx_lambda" {
  source = "./lambda"

  function_name="olx_lambda"
  source_file="show_page_lambda"
}

resource "aws_lambda_event_source_mapping" "event_source_mapping" {
  event_source_arn = module.olx_sqs.sqs_arn
  enabled          = true
  function_name    = module.olx_lambda.lambda_arn
  batch_size       = 1
}