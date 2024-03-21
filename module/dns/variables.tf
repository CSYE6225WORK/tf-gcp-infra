variable "instance_ip" {
  type = string
}

variable "name" {
  type    = string
  default = "api.jasonlidevelop.com."
}

variable "type" {
  type    = string
  default = "A"
}

variable "ttl" {
  type    = number
  default = 300
}

variable "managed_zone" {
  type    = string
  default = "my-dns-zone"
}
