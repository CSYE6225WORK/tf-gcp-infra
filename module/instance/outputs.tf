# output "nat_ip" {
#   value = google_compute_instance.instance.network_interface[0].access_config[0].nat_ip
# }

output "template_instance" {
  value = google_compute_instance_template.instance.id
}

output "template_instance_name" {
  value = google_compute_instance_template.instance.name
}
