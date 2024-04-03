resource "google_compute_backend_service" "web_backend_service" {
  name          = "web-backend-service"
  protocol      = var.protocol
  health_checks = var.health_checks

  backend {
    group = var.backend_group
  }
}

resource "google_compute_url_map" "web_url_map" {
  name            = "web-url-map"
  default_service = google_compute_backend_service.web_backend_service.id
}

resource "google_compute_managed_ssl_certificate" "web_ssl_cert" {
  name = "web-ssl-cert"
  managed {
    domains = var.domain
  }
}

resource "google_compute_target_https_proxy" "web_https_proxy" {
  name             = "web-https-proxy"
  url_map          = google_compute_url_map.web_url_map.id
  ssl_certificates = [google_compute_managed_ssl_certificate.web_ssl_cert.id]
}

resource "google_compute_global_forwarding_rule" "web_forwarding_rule" {
  name       = "web-forwarding-rule"
  target     = google_compute_target_https_proxy.web_https_proxy.id
  port_range = var.port_range
}
