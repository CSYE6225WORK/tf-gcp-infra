resource "google_cloudfunctions2_function" "function" {
  name     = var.name
  location = var.location

  build_config {
    runtime     = var.runtime
    entry_point = var.entry_point
    source {
      storage_source {
        bucket = var.source_archive_bucket
        object = var.source_archive_object
      }
    }
  }

  service_config {
    environment_variables = {
      API_KEY      = var.api_key
      DATABASE_URL = "mysql://${var.sql_username}:${var.sql_password}@${var.sql_host}/CSYE6225"
    }
    service_account_email = var.service_account_email
    vpc_connector         = var.vpc-vpc_connector
  }

  event_trigger {
    event_type   = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic = var.topic_id
  }

}

resource "google_cloudfunctions2_function_iam_binding" "function_binding" {
  project        = google_cloudfunctions2_function.function.project
  cloud_function = google_cloudfunctions2_function.function.name
  location       = google_cloudfunctions2_function.function.location
  role           = "roles/viewer"
  members        = ["serviceAccount:${var.service_account_email}"]
}
