#Copyright Asere´s Corporation

resource "google_compute_instance_template" "pool-template" {
  machine_type = var.machine_type
  region       = var.region

  disk {
    disk_type    = var.disk_type
    source_image = var.compute_image
    disk_size_gb = var.disk_size_gb
  }
  network_interface {
    network = var.network
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_region_instance_group_manager" "pool" {
  name               = var.instance_group_name
  region             = var.region
  target_size        = var.size
  wait_for_instances = true

  version {
    instance_template = google_compute_instance_template.pool-template.self_link
  }

  timeouts {
    create = "15m"
    update = "15m"
  }

  lifecycle {
    create_before_destroy = true
  }
}