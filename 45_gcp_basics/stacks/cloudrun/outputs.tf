output "function_url" {
  value = google_cloud_run_service.function.status[0].url
}
