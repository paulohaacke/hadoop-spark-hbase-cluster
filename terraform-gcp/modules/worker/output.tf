output "worker_internal" {
  value = google_compute_instance.worker.*.network_interface.0.network_ip
}
