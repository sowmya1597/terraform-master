terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
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
  source                  = "../modules/webserver"
  project_id              = lookup(local.webserver_config, "project_id")
  region                  = lookup(local.webserver_config, "region")
  version_id              = lookup(local.webserver_config, "version_id")
  service_name            = lookup(local.webserver_config, "service_name")
  runtime                 = ""
  cool_down_period        = ""
  cpu_utilization         = {}
  deployment_artifact_url = ""
  env_variables           = {}
  max_instances           = 0
  min_instances           = 0
  min_pending_latency     = ""
}

module "appserver" {
  source = "../modules/appserver"
  image = ""
  instance_name = ""
  machine_type = ""
  startup_script = ""
  zone = ""
}


module "sqlserver" {
  source           = "../modules/sqlserver"
  region           = var.region
  sql_server_name  = "sql-server"
  database_version = "MYSQL_5_7"
  tier             = "db-n1-standard-1"
  db_name          = "usecase1_db"
}









