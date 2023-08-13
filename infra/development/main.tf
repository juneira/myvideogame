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
