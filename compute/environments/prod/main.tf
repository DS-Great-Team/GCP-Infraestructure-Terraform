#Copyright Asere´s Corporation

#prod terraform module instantiation

provider "google" {
  project = "prod-project-cloud"
  region  = "us-central1"
}

module "bastion_instance_groups" {
  source              = "../../../modules/gcs_instance_group"
  instance_group_name = "bastions"
  machine_type        = "n2-highcpu-2"
  region              = "us-central1"
  disk_type           = "pd-ssd"
  compute_image       = "centos-7"
  disk_size_gb        = "100"
  network             = "prod-vpc"
  subnetwork          = "public-subnet"
  size                = 2
}