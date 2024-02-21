variable "project_id" {
  type    = string
  default = "firm-reason-411722"
}

variable "region" {
  type    = string
  default = "us-east4"
}

variable "webapp-tags" {
  type    = list(string)
  default = ["webapp"]
}