provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = "europe-west2"
}

