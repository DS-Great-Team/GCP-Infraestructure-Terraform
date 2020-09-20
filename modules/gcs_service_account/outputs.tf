#Copyright Asere´s Corporation

output "service_account_email" {
  value = "${google_service_account.service_account.email}"
}