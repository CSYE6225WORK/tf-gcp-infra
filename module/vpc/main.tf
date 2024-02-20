resource "google_compute_network" "vpc" {
  count                           = length(var.name)
  name                            = var.name[count.index]
  description                     = "this is my csye6225 class vpc network region"
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "webapp_subnetwork" {
  count         = length(var.name)
  name          = "webapp-${count.index+1}"
  description   = "this is subnet work with webapp"
  ip_cidr_range = var.web_ip_cidr_range
  network       = google_compute_network.vpc[count.index].id
}

resource "google_compute_subnetwork" "db_subnetwork" {
  count         = length(var.name)
  name          = "db-${count.index+1}"
  description   = "this is subnet work with database"
  ip_cidr_range = var.db_ip_cidr_range
  network       = google_compute_network.vpc[count.index].id
}

resource "google_compute_route" "webapp_route" {
  count            = length(var.name)
  name             = "webapp-route-${count.index+1}"
  description      = "this is route to internet gateway which used with webapp subnet to be public"
  dest_range       = var.dest_range
  network          = google_compute_network.vpc[count.index].id
  next_hop_gateway = var.next_hop_gateway
}
