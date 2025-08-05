
resource "google_cloud_run_service" "function" {
  name     = "cube-service"
  location = var.region
  template {
    spec {
      containers {
        image = "${google_artifact_registry_repository.cube_registry.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.cube_registry.repository_id}/cube:latest"
      }
    }
  }
}

resource "google_cloud_run_service_iam_policy" "public_access" {
  service = google_cloud_run_service.function.name
  location = google_cloud_run_service.function.location
  policy_data = data.google_iam_policy.public_iam_policy.policy_data
}

data "google_iam_policy" "public_iam_policy" {
  binding {
    role = "roles/run.invoker"
    members = ["allUsers"]
  }
}