variable "vpc-id" {
  type = string
}

variable "webapp-sub" {
  type = string
}

variable "webapp-tags" {
  type = list(string)
}

variable "zone" {
  type = string
}

variable "sql_username" {
  type = string
}

variable "sql_password" {
  type = string
}

variable "sql_host" {
  type = string
}

variable "email" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "n2-standard-2"
}

variable "image" {
  type    = string
  default = "firm-reason-411722/webapp-image-1710978411"
}

variable "type" {
  type    = string
  default = "pd-balanced"
}

variable "size" {
  type    = string
  default = "100"
}

variable "service_account_scopes" {
  type    = list(string)
  default = ["cloud-platform"]
}
