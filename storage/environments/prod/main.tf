#Copyright Asere´s Corporation

#prod terraform module instantiation

provider "google" {
  project = "prod-project-cloud"
  region  = "us-central1"
}

module "state_bucket" {
  source        = "../../../modules/gcs_bucket"
  bucket_prefix = "${var.bucket_prefix}"
}
