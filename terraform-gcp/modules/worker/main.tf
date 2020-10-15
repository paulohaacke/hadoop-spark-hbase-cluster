resource "google_compute_instance" "worker" {
  count        = var.machine_count
  name         = "worker-${count.index + 1}"
  machine_type = var.machine_type
  description  = "worker"
  labels       = { "hadoop-machine-type" : "worker" }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      size  = 100
    }
  }
  metadata = {
    ssh-keys = "${var.user_name}:${file(var.key_ssh)}"
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
