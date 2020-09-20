#Copyright Asere´s Corporation

output "fingerprint" {
  description = "The fingerprint of the instance group manager."
  value       = google_compute_region_instance_group_manager.pool.fingerprint
}

output "instance_group" {
  description = "The full URL of the instance group created by the manager."
  value       = google_compute_region_instance_group_manager.pool.instance_group
}

output "self_link" {
  description = "The URL of the created resource."
  value       = google_compute_region_instance_group_manager.pool.self_link
}
