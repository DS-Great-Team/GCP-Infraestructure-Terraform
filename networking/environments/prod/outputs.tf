#Copyright Asere´s Corporation

#prod terraform outputs definition

output "vpc_name" {
  value = module.main_vpc.vpc_name
}

output "subnetwork_name" {
  value = module.public_subnet.subnetwork_name
}