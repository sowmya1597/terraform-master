resource "google_app_engine_standard_app_version" "default" {
  version_id = var.version_id
  service    = var.service_name
  runtime    = var.runtime

  env_variables = var.env_variables

  deployment {
    zip {
      source_url = var.deployment_artifact_url
    }
  }

  automatic_scaling {
    cool_down_period    = var.cool_down_period
    cpu_utilization     = var.cpu_utilization
    max_instances       = var.max_instances
    min_instances       = var.min_instances
    min_pending_latency = var.min_pending_latency
  }
}
