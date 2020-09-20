#Compute
variable "app_name" {
  type = string
  description = "Application name"
}

variable "app_domain" {
  type = string
  description = "Application domain"
}

variable "app_environment" {
  type = string
  description = "Application environment"
}

variable "app_node_count" {
  type = string
  description = "Number of servers to build"
}

variable "gcp_auth_file" {
  type = string
  description = "GCP authentication file"
}

variable "app_project" {
  type = string
  description = "GCP project name"
}

variable "gcp_region_1" {
  type = string
  description = "GCP region"
}

variable "gcp_zone_1" {
  type = string
  description = "GCP zone"
}

variable "private_subnet_cidr_1" {
  type = string
  description = "private subnet CIDR 1"
}

variable "public_subnet_cidr_1" {
  type = string
  description = "public subnet CIDR 1"
}

variable "user" {
  type = string
  default = "ubuntu"
}

variable "ssh_key" {
  type = string
  default = "~/.ssh/id_rsa_gcp.pub"
}

#Bastion
variable "bastion_name" {
  description = "The name of the bastion compute instance, DNS hostname, IAM service account, and the prefix for resources such as the firewall rule, instance template, and instance group."
  default     = "ro-bastion"
}

variable "machine_type" {
  description = "The GCE machine type of the bastion."
  default     = "n1-standard-1"
}

variable "image_family" {
  description = "The family for the compute image. This module has assumptions about the OS being Ubuntu."
  default     = "ubuntu-1804-lts"
}

variable "image_project" {
  description = "The project of the compute image owner."
  default     = "gce-uefi-images"
}

variable "subnetwork_name" {
  description = "The name of the existing subnetwork where the bastion will be created."
}

variable "network_name" {
  description = "The name of the network where the bastion SSH firewall rule will be created. This network is the parent of $subnetwork"
}

variable "ssh_cidr_blocks" {
  type        = list(string)
  description = "A list of CIDRs allowed to SSH to the bastion. Override the module default by specifying an empty list, []"
  default     = ["0.0.0.0/0"]
}