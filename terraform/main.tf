provider "aws" {
  region = var.region
}

module "network" {
  source      = "./modules/network"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "server" {
  source        = "./modules/server"
  ami_id        = "ami-0199fa5fada510433"
  instance_type = var.instance_type
  subnet_id     = module.network.subnet_id
  vpc_id        = module.network.vpc_id
}

output "jenkins_ip" {
  value = module.server.jenkins_public_ip
}
