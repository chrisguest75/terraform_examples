resource "google_storage_bucket" "tf_state" {
  name                        = "${var.project_id}-tf-state"
  location                    = "europe"
  uniform_bucket_level_access = true
  force_destroy               = true

}