variable "location" {
  type = string
}

variable "service_account_email" {
  type = string
}

variable "rotation_period" {
  type    = string
  default = "2592000s"
}
