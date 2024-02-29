resource "google_sql_database_instance" "cloud_sql_instance" {
  name                = "cloud-sql-instance"
  region              = var.region
  database_version    = var.database_version
  deletion_protection = var.deletion_protection

  depends_on = [var.private_vpc_connection]

  settings {
    tier              = var.tier
    availability_type = var.availability_type
    disk_type         = var.disk_type
    disk_size         = var.disk_size

    ip_configuration {
      ipv4_enabled                                  = var.ipv4_enabled
      private_network                               = var.vpc-id
      enable_private_path_for_google_cloud_services = var.enable_private_path_for_google_cloud_services
    }

    backup_configuration {
      binary_log_enabled = true
      enabled            = true
    }
  }
}

resource "google_sql_database" "cloud_sql_database" {
  count    = length(var.database_name)
  name     = var.database_name[count.index]
  instance = google_sql_database_instance.cloud_sql_instance.name
}

resource "random_password" "password" {
  length  = 8
  special = false
}

resource "google_sql_user" "cloud_sql_user" {
  name     = var.sql_username
  instance = google_sql_database_instance.cloud_sql_instance.name
  password = random_password.password.result
  host     = var.sql_host
}
