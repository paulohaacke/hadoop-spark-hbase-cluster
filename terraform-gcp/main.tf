provider "google" {
  project = "hdfs-tsd-testes"
  region  = "us-central1"
  zone    = "us-central1-c"
}

module "manager" {
  source        = "./modules/manager"
  user_name     = var.user_name
  machine_type  = var.machine_type
  machine_count = var.manager_count
  key_ssh       = var.key_ssh
}

module "worker" {
  source        = "./modules/worker"
  user_name     = var.user_name
  machine_type  = var.machine_type
  machine_count = var.worker_count
  key_ssh       = var.key_ssh
}
