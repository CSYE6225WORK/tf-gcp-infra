resource "google_compute_network" "vpc_network" {
  name                            = "vpc-network"
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "webapp_subnetwork" {
  name          = "webapp"
  ip_cidr_range = var.web_ip_cidr_range
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "db_subnetwork" {
  name          = "db"
  ip_cidr_range = var.db_ip_cidr_range
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_route" "webapp_route" {
  name             = "webapp-route"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc_network.id
  next_hop_gateway = "default-internet-gateway"
}
