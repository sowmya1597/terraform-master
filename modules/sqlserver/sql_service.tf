resource "google_sql_database_instance" "default" {
  name             = var.sql_server_name
  database_version = var.database_version
  region           = var.region

  settings {
    tier = var.tier
  }

  deletion_protection = false
}

resource "google_sql_database" "default" {
  name     = var.db_name
  instance = google_sql_database_instance.default.name
}


