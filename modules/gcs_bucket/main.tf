#Copyright Asere´s Corporation

resource "random_id" "rand_id" {
  byte_length = 8
}

resource "google_storage_bucket" "bucket" {
  name = "${var.bucket_prefix}-${random_id.rand_id.hex}"
}