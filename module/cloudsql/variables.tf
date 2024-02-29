variable "vpc-id" {
  type = string
}

variable "region" {
  type = string
}

variable "private_vpc_connection" {
  type = object({
    id                      = string
    network                 = string
    peering                 = string
    reserved_peering_ranges = list(string)
    service                 = string
    timeouts = object({
      create = string
      delete = string
      update = string
    })
  })
}

variable "tier" {
  type    = string
  default = "db-f1-micro"
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "database_version" {
  type    = string
  default = "MYSQL_8_0"
}

variable "availability_type" {
  type    = string
  default = "REGIONAL"
}

variable "disk_type" {
  type    = string
  default = "pd-ssd"
}

variable "disk_size" {
  type    = number
  default = 100
}

variable "ipv4_enabled" {
  type    = bool
  default = false
}

variable "enable_private_path_for_google_cloud_services" {
  type    = bool
  default = false
}

variable "database_name" {
  type    = list(string)
  default = ["webapp"]
}

variable "sql_username" {
  type    = string
  default = "webapp"
}

variable "sql_host" {
  type    = string
  default = "%"
}
