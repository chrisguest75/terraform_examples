

resource "google_project_service" "firestore" {
  service = "firestore.googleapis.com"

  disable_on_destroy = false  
}

