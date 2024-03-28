variable "service_account_email" {
  type = string
}

variable "topic_name" {
  type    = string
  default = "verify_email"
}

variable "message_retention_duration" {
  type    = string
  default = "604800s"
}