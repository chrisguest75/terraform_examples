resource "google_firestore_database" "database" {
  name        = "(default)"
  location_id = var.firestore_location
  type        = "FIRESTORE_NATIVE"

  #tags = var.labels
}

