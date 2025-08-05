
resource "google_cloud_run_service" "function" {
  name     = "cube_service"
  location = var.region
  template {
    spec {
      containers {
        image = "${google_artifact_registry_repository.cube_registry.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.cube_registry.repository_id}/my-image:latest"
      }
    }
  }
}
