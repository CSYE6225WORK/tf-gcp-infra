variable "region" {
  type = string
}

variable "name" {
  type    = string
  default = "vpc-network"
}

variable "routing_mode" {
  type    = string
  default = "REGIONAL"
}

variable "web_ip_cidr_range" {
  type    = string
  default = "10.0.0.0/24"
}

variable "dest_range" {
  type    = string
  default = "0.0.0.0/0"
}

variable "next_hop_gateway" {
  type    = string
  default = "default-internet-gateway"
}

variable "global_address_purpose" {
  type    = string
  default = "VPC_PEERING"
}

variable "global_address_address_type" {
  type    = string
  default = "INTERNAL"
}

variable "global_address_prefix_length" {
  type    = string
  default = "16"
}

variable "service_networking" {
  type    = string
  default = "servicenetworking.googleapis.com"
}

variable "connector_ip_cidr_range" {
  type    = string
  default = "10.8.0.0/28"
}

