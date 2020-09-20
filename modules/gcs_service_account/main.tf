#Copyright Asere´s Corporation

resource "google_project_service" "resourcemanager" {
  service                    = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "iam" {
  service                    = "iam.googleapis.com"
  disable_dependent_services = true
}

resource "google_service_account" "service_account" {
  account_id   = "${var.service_account_id}"
  display_name = "${var.service_account_description}"
}