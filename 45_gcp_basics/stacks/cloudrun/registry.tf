resource "google_artifact_registry_repository" "cube_registry" {
  location      = var.region
  repository_id = "${var.resource_prefix}-cube"
  description   = "Testing cloudrun deployment with terraform"
  format        = "DOCKER" # Possible formats: DOCKER, MAVEN, NPM, PYTHON, APT, YUM, GO

  labels = var.labels
}