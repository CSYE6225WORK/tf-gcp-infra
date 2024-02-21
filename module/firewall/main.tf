resource "google_compute_firewall" "firewall" {
  name        = "webapp-firewall"
  description = "default setting for firewall which used in webapp"
  network     = var.vpc-id

  dynamic "allow" {
    for_each = var.firewall-rules
    content {
      protocol = allow.key
      ports = allow.value
    }
  }

  source_ranges = var.source_ranges
  target_tags   = var.webapp-tags
}
