variable "vpc-id" {
  type = string
}

variable "webapp-tags" {
  type = list(string)
}

variable "tcp-port" {
  type    = list(string)
  default = ["3000"]
}

variable "source_ranges" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "firewall-rules" {
  type = object({
    tcp = list(string)
  })
  default = {
    tcp = [ "3000" ]
  }
}
