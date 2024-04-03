# resource "google_compute_instance" "instance" {
#   name         = "webapp-instance"
#   description  = "webapp api for csye6225 class"
#   machine_type = var.machine_type
#   zone         = var.zone

#   boot_disk {
#     initialize_params {
#       image = var.image
#       type  = var.type
#       size  = var.size
#     }
#   }

#   network_interface {
#     network    = var.vpc-id
#     subnetwork = var.webapp-sub

#     access_config {

#     }
#   }

#   metadata_startup_script = <<-EOT
#     sudo bash -c "echo 'DATABASE_URL=mysql://${var.sql_username}:${var.sql_password}@${var.sql_host}/CSYE6225' > /opt/app/.env"
#     sudo pnpm run -C /opt/app prisma-migrate
#     sudo systemctl start nodeapp.service
#   EOT

#   tags = var.webapp-tags

#   service_account {
#     email  = var.email
#     scopes = var.service_account_scopes
#   }
# }

resource "google_compute_instance_template" "instance" {
  name         = "webapp-instance"
  description  = "webapp api for csye6225 class"
  machine_type = var.machine_type

  disk {
    source_image = var.image
    disk_type    = var.type
    disk_size_gb = var.size
  }

  network_interface {
    network    = var.vpc-id
    subnetwork = var.webapp-sub
    access_config {

    }
  }

  metadata_startup_script = <<-EOT
    sudo bash -c "echo 'DATABASE_URL=mysql://${var.sql_username}:${var.sql_password}@${var.sql_host}/CSYE6225' > /opt/app/.env"
    sudo pnpm run -C /opt/app prisma-migrate
    sudo systemctl start nodeapp.service
  EOT

  tags = var.webapp-tags

  service_account {
    email  = var.email
    scopes = var.service_account_scopes
  }
}
