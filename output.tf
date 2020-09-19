output "server-1" {
  value = google_compute_instance.server-1.name
}

output "server-1-internal-ip" {
  value = google_compute_instance.server-1.network_interface.0.network_ip
}
