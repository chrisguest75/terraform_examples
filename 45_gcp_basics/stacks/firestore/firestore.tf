resource "google_firestore_database" "database" {
  name        = "(default)"
  location_id = var.firestore_location
  type        = "FIRESTORE_NATIVE"

  #tags = var.labels
}

output "firestore_database_name" {
  value = google_firestore_database.database.name
}

output "firestore_database_edition" {
  value = google_firestore_database.database.database_edition
}