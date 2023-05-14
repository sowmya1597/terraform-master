output "ip_address" {
  value = google_app_engine_standard_app_version.default.default_hostname
}