variable "sql_username" {
  type = string
}

variable "sql_password" {
  type = string
}

variable "sql_host" {
  type = string
}

variable "topic_id" {
  type = string
}

variable "service_account_email" {
  type = string
}

variable "vpc-vpc_connector" {
  type = string
}

variable "location" {
  type    = string
  default = "us-east4"
}

variable "name" {
  type    = string
  default = "function-sendEmail"
}

variable "runtime" {
  type    = string
  default = "nodejs20"
}

variable "source_archive_bucket" {
  type    = string
  default = "csye6225_mybucket"
}

variable "source_archive_object" {
  type    = string
  default = "severless.zip"
}

variable "entry_point" {
  type    = string
  default = "sendVerificationEmail"
}

variable "api_key" {
  type    = string
  default = "c19828dd3852b57b6f0d05a6c88e833b-f68a26c9-bcbacc83"
}