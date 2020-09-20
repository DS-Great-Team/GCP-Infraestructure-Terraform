#Copyright Asere´s Corporation

#prod terraform outputs definition

output "vpc_name" {
  value = "${module.main_vpc.vpc_name}"
}

output "subnetwork_name" {
  value = "${module.main_subnet.subnetwork_name}"
}

output "nat_ip_address" {
  value = google_compute_address.nat_ip.address
}