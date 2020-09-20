#Copyright Asere´s Corporation

#prod terraform outputs definition

output "bucket_name" {
  value = "${module.state_bucket.bucket_name}"
}
