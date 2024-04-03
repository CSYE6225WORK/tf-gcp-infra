module "vpc" {
  source = "./module/vpc"
}

module "iam" {
  source  = "./module/iam"
  project = var.project_id
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
  email        = module.iam.service_account_email
}

module "gcloudSQL" {
  source                 = "./module/cloudsql"
  vpc-id                 = module.vpc.vpc-id
  region                 = var.region
  private_vpc_connection = module.vpc.private_vpc_connection
}

module "pubsub" {
  source                = "./module/pubsub"
  service_account_email = module.iam.service_account_email
}

module "serverless" {
  source                = "./module/severless"
  sql_username          = module.gcloudSQL.sql_username
  sql_password          = module.gcloudSQL.sql_password
  sql_host              = module.gcloudSQL.sql_host
  topic_id              = module.pubsub.topic_id
  service_account_email = module.iam.service_account_email
  vpc-vpc_connector     = module.vpc.vpc-connector
  location              = var.region
}

module "autoscale" {
  source             = "./module/autoscale"
  instance_template  = module.instance.template_instance
  base_instance_name = module.instance.template_instance_name
  region             = var.region
}

module "loadbalance" {
  source        = "./module/loadbalance"
  health_checks = [module.autoscale.health_checks]
  backend_group = module.autoscale.backend_group
}

module "firewall" {
  source      = "./module/firewall"
  vpc-id      = module.vpc.vpc-id
  webapp-tags = var.webapp-tags
}

module "dns" {
  source      = "./module/dns"
  instance_ip = module.loadbalance.ip_address
}

