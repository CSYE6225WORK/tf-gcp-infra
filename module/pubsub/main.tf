resource "google_pubsub_topic" "topic" {
  name                       = var.topic_name
  message_retention_duration = var.message_retention_duration
}

# resource "google_pubsub_subscription" "subscription" {
#   name                       = "email-subscription"
#   topic                      = google_pubsub_topic.topic.name
#   message_retention_duration = var.message_retention_duration
# }

resource "google_pubsub_topic_iam_binding" "binding" {
  project = google_pubsub_topic.topic.project
  topic   = google_pubsub_topic.topic.name
  role    = "roles/admin"
  members = ["serviceAccount:${var.service_account_email}"]
}

# resource "google_pubsub_subscription_iam_binding" "binding" {
#   subscription = google_pubsub_subscription.subscription.name
#   role         = "roles/editor"
#   members      = ["serviceAccount:${var.service_account_email}"]
# }
