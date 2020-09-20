#Copyright Asere´s Corporation

#prod terraform module instantiation

provider "google" {
  project = "prod-project-cloud"
  region  = "us-central1"
}

module "main_vpc" {
  source   = "../../../modules/gcs_vpc"
  vpc_name = var.vpc_name
}

module "public_subnet" {
  source          = "../../../modules/gcs_subnet"
  subnetwork_name = "public-subnet"
  subnetwork_cidr = var.subnetwork_cidr
  subnetwork_vpc  = module.main_vpc.self_link
}

module "firewall-allow-ssh" {
  source                 = "../../../modules/gcs_firewall_rule"
  firewall_rule_name     = "allow-ssh"
  firewall_vpc           = module.main_vpc.self_link
  firewall_protocol      = "tcp"
  firewall_ports         = ["22"]
  firewall_target_tags   = ["allow-ssh"]
  firewall_source_ranges = ["0.0.0.0/0"]
}

module "firewall-allow-rdp" {
  source                 = "../../../modules/gcs_firewall_rule"
  firewall_rule_name     = "allow-rdp"
  firewall_vpc           = module.main_vpc.self_link
  firewall_protocol      = "tcp"
  firewall_ports         = ["3389"]
  firewall_target_tags   = ["allow-rdp"]
  firewall_source_ranges = ["0.0.0.0/0"]
}

module "firewall-allow-internal-icmp" {
  source                 = "../../../modules/gcs_firewall_rule"
  firewall_rule_name     = "allow-internal-icmp"
  firewall_vpc           = module.main_vpc.self_link
  firewall_protocol      = "tcp"
  firewall_ports         = ["0-65535"]
  firewall_target_tags   = ["allow-icmp"]
  firewall_source_ranges = [var.subnetwork_cidr]
}

