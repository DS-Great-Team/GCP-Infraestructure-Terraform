#Copyright Asere´s Corporation

resource "google_compute_network" "vpc_definition" {
  name                            = var.vpc_name
  auto_create_subnetworks         = false
  delete_default_routes_on_create = "true"
}