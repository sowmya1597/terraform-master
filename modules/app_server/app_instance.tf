resource "google_app_engine_standard_app_version" "default" {
  version_id      = "v1"
  service         = "app-server"
  runtime         = "python38"
  instance_class  = var.instance_type

  handlers {
    url_regex = ".*"
    script    = "auto"
  }
}


