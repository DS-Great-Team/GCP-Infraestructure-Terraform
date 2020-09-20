#Copyright Asere´s Corporation

#prod terraform module instantiation

provider "google" {
  project = "my-project-prod"
  region  = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "my-state-bucket"
    prefix = "IAM/state/prod"
  }
}

module "gcs_compute_prod_service_account" {
  source                      = "../../../modules/gcs_service_account"
  service_account_id          = "${var.service_account_id}"
  service_account_description = "${var.service_account_description}"
}