provider "google" {
  project = lookup(local.webserver_config, "project_id")
  region  = lookup(local.webserver_config, "region")
}

terraform {
  backend "gcs" {
    bucket = "" # Update: GCS bucket name to store terraform tfstate
    prefix = "usecase1"
  }
}


module "service_account" {
  source     = "./modules/service-account"
  project_id = lookup(local.webserver_config, "project_id")
}


module "web_server" {
  source       = "./modules/web_server"
  project_id   = lookup(local.webserver_config, "project_id")
  region       = lookup(local.webserver_config, "region")
  version_id   = lookup(local.webserver_config, "version_id")
  service_name = lookup(local.webserver_config, "service_name")
}

/*module "app_server" {
  source = "./modules/app_server"
  project_id = var.project_id
  region = var.region
  instance_type = var.app_server_instance_type
}

module "sql_server" {
  source = "./modules/sql_server"
  project_id = var.project_id
  region = var.region
}*/



