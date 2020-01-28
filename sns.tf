resource "aws_sns_topic" "user_updates" {
  name = "user-updates-topic"
}

resource "aws_sns_topic_subscription" "topic_lambda" {
  topic_arn = "${aws_sns_topic.user_updates.arn}"
  protocol  = "lambda"
  endpoint  = "${aws_lambda_function.test_lambda.arn}"
}