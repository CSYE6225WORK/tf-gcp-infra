variable "health_checks" {
  type = list(string)
}

variable "backend_group" {
  type = string
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "domain" {
  type    = list(string)
  default = ["api.jasonlidevelop.com"]
}

variable "port_range" {
  type    = string
  default = "443"
}
