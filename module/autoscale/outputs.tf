output "health_checks" {
  value = google_compute_health_check.web_health_check.id
}

output "backend_group" {
  value = google_compute_region_instance_group_manager.web_manager.instance_group
}