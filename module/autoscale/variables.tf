variable "instance_template" {
  type = string
}

variable "region" {
  type = string
}

variable "base_instance_name" {
  type = string
}

variable "request_path" {
  type    = string
  default = "/api/v1/healthz"
}
variable "port" {
  type    = number
  default = 3000
}

variable "initial_delay_sec" {
  type    = number
  default = 300
}

variable "max_replicas" {
  type    = number
  default = 5
}

variable "min_replicas" {
  type    = number
  default = 1
}

variable "cpu_utilization_target" {
  type    = number
  default = 0.05
}

