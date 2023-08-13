resource "aws_sqs_queue" "sqs_queue" {
  name = var.sqs_name
}

resource "aws_sqs_queue_policy" "sqs_queue_policy" {
  queue_url = aws_sqs_queue.sqs_queue.id

  policy = <<POLICY
{
  "Version": "2023-08-12",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.sqs_queue.arn}"
    }
  ]
}
POLICY
}

output "sqs_arn" {
  value = aws_sqs_queue.sqs_queue.arn

  depends_on = [ aws_sqs_queue.sqs_queue ]
}