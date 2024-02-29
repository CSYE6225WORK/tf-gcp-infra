module "vpc" {
  source = "./module/vpc"
}

module "firewall" {
  source      = "./module/firewall"
  vpc-id      = module.vpc.vpc-id
  webapp-tags = var.webapp-tags
}

module "instance" {
  source       = "./module/instance"
  vpc-id       = module.vpc.vpc-id
  webapp-sub   = module.vpc.webapp-sub
  webapp-tags  = var.webapp-tags
  zone         = var.zone
  sql_username = module.gcloudSQL.sql_username
  sql_password = module.gcloudSQL.sql_password
  sql_host     = module.gcloudSQL.sql_host
}

module "gcloudSQL" {
  source                 = "./module/cloudsql"
  vpc-id                 = module.vpc.vpc-id
  region                 = var.region
  private_vpc_connection = module.vpc.private_vpc_connection
}
