variable "vpc-id" {
  type = string
}

variable "webapp-sub" {
  type = string
}

variable "webapp-tags" {
  type = list(string)
}

variable "machine_type" {
  type    = string
  default = "n2-standard-2"
}

variable "zone" {
  type    = string
  default = "us-east4-c"
}

variable "image" {
  type    = string
  default = "firm-reason-411722/webapp-image"
}

variable "type" {
  type    = string
  default = "pd-balanced"
}

variable "size" {
  type    = string
  default = "100"
}
