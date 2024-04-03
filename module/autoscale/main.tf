resource "google_compute_health_check" "web_health_check" {
  name = "web-health-check"

  http_health_check {
    request_path = var.request_path
    port         = var.port
  }
}

resource "google_compute_region_instance_group_manager" "web_manager" {
  name               = "web-instance-group-manager"
  region             = var.region
  base_instance_name = var.base_instance_name

  named_port {
    name = "http"
    port = var.port
  }

  version {
    instance_template = var.instance_template
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.web_health_check.id
    initial_delay_sec = var.initial_delay_sec
  }

}

resource "google_compute_region_autoscaler" "web_autoscaler" {
  name   = "web-autoscaler"
  region = var.region
  target = google_compute_region_instance_group_manager.web_manager.id

  autoscaling_policy {
    max_replicas = var.max_replicas
    min_replicas = var.min_replicas
    cpu_utilization {
      target = var.cpu_utilization_target
    }
  }
}
