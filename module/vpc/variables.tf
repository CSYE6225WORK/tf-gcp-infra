variable "name" {
  type = list(string)
  default = [ "vpc-network1" ]
}

variable "web_ip_cidr_range" {
  type = string
  default = "10.0.0.0/24"
}

variable "db_ip_cidr_range" {
  type = string
  default = "10.0.1.0/24"
}

variable "dest_range" {
  type = string
  default = "0.0.0.0/0"
}

variable "next_hop_gateway" {
  type = string
  default = "default-internet-gateway"
}

