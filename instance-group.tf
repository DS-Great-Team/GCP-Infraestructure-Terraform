resource "google_compute_region_instance_group_manager" "bastion" {
  name = "igm-${google_compute_instance_template.bastion.name}"

  base_instance_name = var.bastion_name
  version {
    instance_template = google_compute_instance_template.bastion.self_link
  }
  region                    = var.gcp_region_1
  distribution_policy_zones = var.availability_zones

  target_size = 2

}

