resource "google_app_engine_standard_app_version" "default" {
  version_id = var.version_id
  service    = var.service_name
  runtime    = var.runtime

  env_variables = var.env_variables

  entrypoint {
    shell = "java -jar ../myapp.jar"
  }
  
  deployment {
    zip {
      source_url = var.deployment_artifact_url
    }
  }
}
