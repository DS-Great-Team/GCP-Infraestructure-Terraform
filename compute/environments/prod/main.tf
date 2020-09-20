#Copyright Asere´s Corporation

#prod terraform module instantiation

provider "google" {
  project = "my-project-prod"
  region  = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "my-state-bucket"
    prefix = "Compute/state/prod"
  }
}

module "bastion_instance_groups" {
  source              = "../../../modules/gcs_instance_group"
  instance_group_name = "bastions"
  machine_type        = "e2-standard-2"
  region              = "us-central1"
  disk_type           = "pd-ssd"
  compute_image       = "asdassd"
  disk_size_gb        = "100"
  network             = "prod"
  size                = 2
}