#Copyright Asere´s Corporation

#prod terraform module instantiation

provider "google" {
  project = "my-project-prod-prod"
  region  = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "my-state-bucket"
    prefix = "Storage/state/prod"
  }
}

module "state_bucket" {
  source        = "../../../modules/gcs_bucket"
  bucket_prefix = "${var.bucket_prefix}"
}
