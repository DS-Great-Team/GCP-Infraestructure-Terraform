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

