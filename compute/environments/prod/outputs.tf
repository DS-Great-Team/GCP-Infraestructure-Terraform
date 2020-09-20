#Copyright Asere´s Corporation

#prod terraform outputs definition

data "terraform_remote_state" "iam" {
  backend = "gcs"

  config = {
    bucket = "${var.bucket_name}"
    prefix = "IAM/state/${var.env}"
  }
}
data "terraform_remote_state" "networking" {
  backend = "gcs"

  config = {
    bucket = "${var.bucket_name}"
    prefix = "Network/state/${var.env}"
  }
}
data "terraform_remote_state" "storage" {
  backend = "gcs"

  config = {
    bucket = "${var.bucket_name}"
    prefix = "Storage/state/${var.env}"
  }
}