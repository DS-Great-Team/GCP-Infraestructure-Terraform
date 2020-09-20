#Copyright Asere´s Corporation

output "vpc_name" {
  value = "${google_compute_network.vpc_definition.name}"
}

output "self_link" {
  value = "${google_compute_network.vpc_definition.self_link}"
}