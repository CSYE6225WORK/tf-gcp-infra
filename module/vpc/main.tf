resource "google_compute_network" "vpc" {
  name                            = var.name
  description                     = "this is my csye6225 class vpc network region"
  auto_create_subnetworks         = false
  routing_mode                    = var.routing_mode
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "webapp_subnetwork" {
  name          = "webapp"
  description   = "this is subnet work with webapp"
  ip_cidr_range = var.web_ip_cidr_range
  network       = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "db_subnetwork" {
  name          = "db"
  description   = "this is subnet work with database"
  ip_cidr_range = var.db_ip_cidr_range
  network       = google_compute_network.vpc.id
}

resource "google_compute_route" "webapp_route" {
  name             = "webapp-route"
  description      = "this is route to internet gateway which used with webapp subnet to be public"
  dest_range       = var.dest_range
  network          = google_compute_network.vpc.id
  next_hop_gateway = var.next_hop_gateway
}
