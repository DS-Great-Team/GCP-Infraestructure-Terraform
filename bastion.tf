resource "google_compute_instance_template" "bastion" {
  name_prefix = var.bastion_name
  description = "${var.bastion_name} bastion"

  # The tag named after the bastion, is required for the SSH firewall rule.
  tags = [var.bastion_name, "terraform-managed"]

  instance_description = "${var.bastion_name} bastion"
  machine_type         = var.machine_type
  can_ip_forward       = false

  disk {
    source_image = data.google_compute_image.ubuntu.self_link
    boot         = true
  }

  network_interface {
    network    = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.public_subnet_1.name
    # This is required to configure a public IP address.
    access_config {}
  }

  # Ref for GCE SSH key management: https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys
  metadata = {
    block-project-ssh-keys = "TRUE"
    ssh-keys               = "ubuntu:${var.ssh_public_key_file}"
  }
}

