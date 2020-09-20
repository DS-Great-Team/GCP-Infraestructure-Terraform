# allow ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.app_name}-${var.app_environment}-fw-allow-ssh"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["ssh"]
}

# allow rdp
resource "google_compute_firewall" "allow-rdp" {
  name    = "${var.app_name}-${var.app_environment}-fw-allow-rdp"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  target_tags = ["rdp"]
}

#Bastion rules
resource "google_compute_firewall" "bastion_ssh" {
  # Only add this rule if the list of ssh_cidr_blocks is set.
  count             = length(var.ssh_cidr_blocks) > 0 ? 1 : 0
  name        = "${var.bastion_name}-ssh"
  description = "Allow SSH access to the ${var.bastion_name} bastion"
  network     = var.network_name.vpc.name

  source_ranges = var.ssh_cidr_blocks
  target_tags   = [var.bastion_name]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

