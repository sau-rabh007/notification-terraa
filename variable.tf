#variable  "aws_access_key" {}
#variable  "aws_secret_key" {}

#variable "aws_region" {
#    description = "Region for the VPC"
# }
 
 variable "slack_user"{
     description = "slack pipeline name"
 }
 variable "slack_channel"{
     description = "slack channel name"
 }
 variable "slack_webhookurl"{
     description = "slack slack_webhookurl name"
 }

 variable "tag_name" {
    description = "give the tag name"
 }

variable "tag_Project" {
    description = "give the tag  Project"
 }

variable "tag_Environment" {
    description = "give the tag Environment"
}
 
 
variable "pipeline_name" {
    description = "give the tag Environment"
}
variable "lambda_name" {
    description = "lambda name for the notification"
}