

resource "google_project_service" "firestore" {
  service = "firestore.googleapis.com"

  disable_on_destroy = false  
}

resource "google_project_service" "cloudfunctions" {
  service = "cloudfunctions.googleapis.com"

  disable_on_destroy = false  
}

resource "google_project_service" "artifactregistry" {
  service = "artifactregistry.googleapis.com"

  disable_on_destroy = false  
}

resource "google_project_service" "cloudrunadmin" {
  service = "run.googleapis.com"

  disable_on_destroy = false  
}