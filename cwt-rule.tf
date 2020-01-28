resource "aws_cloudwatch_event_rule" "console" {
  name        = "capture-aws-sign-in"
  description = "Capture each AWS Console Sign In"

  event_pattern = <<PATTERN
  {
  "source": [
    "aws.codepipeline"
  ],
  "detail-type": [
    "CodePipeline Pipeline Execution State Change"
  ],
  "detail": {
    "state": [
      "STARTED",
      "SUCCEEDED",
      "FAILED"
    ],
    "pipeline": [
      "${var.pipeline_name}"
    ]
  }
}
PATTERN
}



resource "aws_cloudwatch_event_target" "yada" {
  target_id = "Yada"
  rule      = "${aws_cloudwatch_event_rule.console.name}"
  arn       = "${aws_sns_topic.user_updates.arn}"
  input_transformer {
    input_paths = {"pipeline":"$.detail.pipeline","state":"$.detail.state"}
    input_template = tostring("\"The Pipeline *<pipeline>* has *<state>*\"")
  }
}
