#Copyright Asere´s Corporation

#prod terraform module instantiation

provider "google" {
  project = "my-project-prod"
  region  = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "my-state-bucket"
    prefix = "Network/state/prod"
  }
}

module "main_vpc" {
  source   = "../../../modules/gcs_vpc"
  vpc_name = "${var.vpc_name}"
}

module "public_subnet" {
  source          = "../../modules/gcs_subnet"
  subnetwork_name = "public-subnet"
  subnetwork_cidr = "${var.subnetwork_cidr}"
  subnetwork_vpc  = "${module.main_vpc.self_link}"
}

module "public_subnet" {
  source          = "../../modules/gcs_subnet"
  subnetwork_name = "public-subnet"
  subnetwork_cidr = "${var.subnetwork_cidr}"
  subnetwork_vpc  = "${module.main_vpc.self_link}"
}

module "firewall-allow-ssh" {
  firewall_rule_name   = "../../modules/gcs_firewall_rule"
  firewall_vpc         = "${module.main_vpc.self_link}"
  firewall_protocol    = "tcp"
  firewall_target_tags = "22"
  target_tags          = "allow_ssh"
}

module "firewall-allow-rdp" {
  firewall_rule_name    = "../../modules/gcs_firewall_rule"
  firewall_vpc          = "${module.main_vpc.self_link}"
  firewall_protocol     = "tcp"
  firewall_ports        = "3389"
  firewall_target_tags  = "allow_rdp"
  firewall_source_range = ""
}

module "firewall-allow-rdp" {
  firewall_rule_name    = "../../modules/gcs_firewall_rule"
  firewall_vpc          = "${module.main_vpc.self_link}"
  firewall_protocol     = "tcp"
  firewall_ports        = "3389"
  firewall_target_tags  = "allow_rdp"
  firewall_source_range = ""
}

module "firewall-allow-internal-icmp" {
  firewall_rule_name    = "../../modules/gcs_firewall_rule"
  firewall_vpc          = "${module.main_vpc.self_link}"
  firewall_protocol     = "-1"
  firewall_ports        = "0-65535"
  firewall_target_tags  = "allow_rdp"
  firewall_source_range = "${var.subnetwork_cidr}"
}