resource "google_compute_instance" "instance" {
  name         = "webapp-instance"
  description = "webapp api for csye6225 class"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      type  = var.type
      size  = var.size
    }
  }

  network_interface {
    network    = var.vpc-id
    subnetwork = var.webapp-sub

    access_config {

    }
  }

  tags = var.webapp-tags
}
