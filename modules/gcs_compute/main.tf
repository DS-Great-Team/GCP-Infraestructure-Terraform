#Copyright Asere´s Corporation

resource "google_compute_instance" "compute" {
  name         = "${var.vm_name}"
  machine_type = "${var.vm_type}"
  zone         = "${var.vm_zone}"

  boot_disk {
    initialize_params {
      image = "${var.vm_os}"
    }
  }

  network_interface {
    network    = "${var.vm_network_name}"
    subnetwork = "${var.vm_subnetwork_name}"
    access_config {
    }
  }

  service_account {
    email  = "${var.vm_sa_email}"
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}