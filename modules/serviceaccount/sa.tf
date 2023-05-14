# Creates a Google Service Account.
resource "google_service_account" "storage" {
  account_id   = "usecase1-svc-storage"
  display_name = "Usecase Storage SA"
}

resource "google_project_iam_member" "storage" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.storage.email}"
}