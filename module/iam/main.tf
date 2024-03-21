resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = var.display_name
}

resource "google_project_iam_binding" "logging_admin" {
  project = var.project
  role    = "roles/logging.admin"

  members = ["serviceAccount:${google_service_account.service_account.email}"]
}

resource "google_project_iam_binding" "monitoring_metric_writer" {
  project = var.project
  role    = "roles/monitoring.metricWriter"

  members = ["serviceAccount:${google_service_account.service_account.email}"]
}
