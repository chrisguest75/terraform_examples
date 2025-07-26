resource "google_storage_bucket" "tf_state" {
  name                        = "${var.project_id}-tf-state"
  location                    = "EU"
  uniform_bucket_level_access = true
  force_destroy               = true

}