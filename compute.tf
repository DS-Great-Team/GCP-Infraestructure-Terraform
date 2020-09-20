# Create server #1
resource "google_compute_instance" "server-1" {
  name         = "${var.app_name}-${var.app_environment}-vm"
  machine_type = "f1-micro"
  zone         = var.gcp_zone_1
  hostname     = "${var.app_name}-${var.app_environment}-vm.${var.app_domain}"
  tags         = ["ssh"]

   metadata = {
    ssh-keys = "${var.user}:${file("${var.ssh_public_key_file}")}"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install"

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.private_subnet_1.name
  }
}
