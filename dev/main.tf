terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.64.0"
    }
  }
}
provider "google" {
  project = lookup(local.webserver_config, "project_id")
  region  = lookup(local.webserver_config, "region")
}

terraform {
  backend "gcs" {
    bucket = "tfstatebucket1" # Update: GCS bucket name to store terraform tfstate
  }
}


module "serviceaccount" {
  source     = "../modules/serviceaccount"
  project_id = lookup(local.webserver_config, "project_id")
}


module "webserver" {
  source       = "../modules/webserver"
  project_id   = lookup(local.webserver_config, "project_id")
  region       = lookup(local.webserver_config, "region")
  version_id   = lookup(local.webserver_config, "version_id")
  service_name = lookup(local.webserver_config, "service_name")
  runtime = ""
  cool_down_period = ""
  cpu_utilization = {}
  deployment_artifact_url = ""
  env_variables = {}
  max_instances = 0
  min_instances = 0
  min_pending_latency = ""
}

/*module "appserver" {
  source = "./modules/app_server"
  project_id = var.project_id
  region = var.region
  instance_type = var.app_server_instance_type
}
*/

module "sqlserver" {
  source = "../modules/sql_server"
  region = var.region
}



