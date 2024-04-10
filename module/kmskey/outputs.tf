output "vm-key" {
  value = google_kms_crypto_key.vm_key.id
}

output "cloudsql_key" {
  value = google_kms_crypto_key.cloudsql_key.id
}

output "storage_key" {
  value = google_kms_crypto_key.storage_key.id
}
