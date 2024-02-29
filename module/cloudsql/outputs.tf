output "sql_username" {
  value = google_sql_user.cloud_sql_user.name
}

output "sql_password" {
  value = google_sql_user.cloud_sql_user.password
}

output "sql_host" {
  value = google_sql_database_instance.cloud_sql_instance.private_ip_address
}