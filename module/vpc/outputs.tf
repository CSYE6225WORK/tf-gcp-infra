output "vpc-id" {
  value = google_compute_network.vpc.id
}

output "webapp-sub" {
  value = google_compute_subnetwork.webapp_subnetwork.id
}
