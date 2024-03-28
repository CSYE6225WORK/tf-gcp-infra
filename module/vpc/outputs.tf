output "vpc-id" {
  value = google_compute_network.vpc.id
}

output "webapp-sub" {
  value = google_compute_subnetwork.webapp_subnetwork.id
}

output "private_vpc_connection" {
  value = google_service_networking_connection.private_vpc_connection
}

output "vpc-connector" {
  value = google_vpc_access_connector.connector.id
}
