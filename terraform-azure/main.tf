provider "azurerm" {
  features {}
}

module "network" {
  source        = "./modules/network"
}

module "manager" {
  source        = "./modules/manager"
  user_name     = var.user_name
  machine_type  = var.machine_type
  machine_count = var.manager_count
  key_ssh       = var.key_ssh
  hadoop_resource = "${module.network.hadoop_resource}"
  subnet_id = "${module.network.subnet_id}"
}

module "worker" {
  source        = "./modules/worker"
  user_name     = var.user_name
  machine_type  = var.machine_type
  machine_count = var.worker_count
  key_ssh       = var.key_ssh
  hadoop_resource = "${module.network.hadoop_resource}"
  subnet_id = "${module.network.subnet_id}"
}
