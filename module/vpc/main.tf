resource "google_compute_network" "vpc" {
  name                            = var.name
  auto_create_subnetworks         = false
  routing_mode                    = var.routing_mode
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "webapp_subnetwork" {
  name          = "webapp"
  ip_cidr_range = var.web_ip_cidr_range
  network       = google_compute_network.vpc.id
}

resource "google_compute_route" "webapp_route" {
  name             = "webapp-route"
  dest_range       = var.dest_range
  network          = google_compute_network.vpc.id
  next_hop_gateway = var.next_hop_gateway
}

resource "google_compute_global_address" "private_service_range" {
  name          = "private-service-range"
  purpose       = var.global_address_purpose
  address_type  = var.global_address_address_type
  prefix_length = var.global_address_prefix_length
  network       = google_compute_network.vpc.id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc.id
  service                 = var.service_networking
  reserved_peering_ranges = [google_compute_global_address.private_service_range.name]
}

resource "google_vpc_access_connector" "connector" {
  name          = "vpc-connector"
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = var.connector_ip_cidr_range
}
