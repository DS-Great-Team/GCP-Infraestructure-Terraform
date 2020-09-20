#Copyright Asere´s Corporation

#prod terraform outputs definition


output "service_account_email" {
  value = "${module.gcs_compute_prod_service_account.service_account_email}"
}