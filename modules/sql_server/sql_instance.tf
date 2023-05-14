resource "google_sql_database_instance" "default" {
  name             = "sql-server"
  database_version = "MYSQL_5_7"
  region           = var.region

  settings {
    tier = "db-n1-standard-1"
  }

  deletion_protection = false
}

resource "google_sql_database" "default" {
  name     = "example-db"
  instance = google_sql_database_instance.default.name
}


