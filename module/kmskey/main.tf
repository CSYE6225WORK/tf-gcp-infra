data "google_project" "project" {}

data "google_storage_project_service_account" "gcs_account" {}

resource "google_project_service_identity" "gcp_sa_cloud_sql" {
  provider = google-beta
  service  = "sqladmin.googleapis.com"
}

resource "google_kms_key_ring" "key_ring" {
  name     = "key-ring-${replace("${timestamp()}", "/[-| |T|Z|:]/", "")}"
  location = var.location
}

resource "google_kms_crypto_key" "vm_key" {
  name            = "vm-key"
  key_ring        = google_kms_key_ring.key_ring.id
  rotation_period = var.rotation_period

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_kms_crypto_key" "cloudsql_key" {
  name            = "cloudsql-key"
  key_ring        = google_kms_key_ring.key_ring.id
  rotation_period = var.rotation_period

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_kms_crypto_key" "storage_key" {
  name            = "storage-key"
  key_ring        = google_kms_key_ring.key_ring.id
  rotation_period = var.rotation_period

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_kms_crypto_key_iam_binding" "cloudsql_key_iam" {
  crypto_key_id = google_kms_crypto_key.cloudsql_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    format("serviceAccount:%s", google_project_service_identity.gcp_sa_cloud_sql.email),
  ]
}

resource "google_kms_crypto_key_iam_binding" "vm_key_iam" {
  crypto_key_id = google_kms_crypto_key.vm_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    format("serviceAccount:%s", var.service_account_email),
    format("serviceAccount:%s", "service-${data.google_project.project.number}@compute-system.iam.gserviceaccount.com"),
    format("serviceAccount:%s", "firm-reason-411722@appspot.gserviceaccount.com")
  ]
}

resource "google_kms_crypto_key_iam_binding" "storage_key_iam" {
  crypto_key_id = google_kms_crypto_key.storage_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    format("serviceAccount:%s", data.google_storage_project_service_account.gcs_account.email_address)
  ]
}
