module "vpc" {
  source = "./module/vpc"
}

module "firewall" {
  source  = "./module/firewall"
  vpc-id  = module.vpc.vpc-id
  webapp-tags = var.webapp-tags
}

module "instance" {
  source     = "./module/instance"
  vpc-id     = module.vpc.vpc-id
  webapp-sub = module.vpc.webapp-sub
  webapp-tags = var.webapp-tags
}
