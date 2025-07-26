resource "google_storage_bucket" "tf_state" {
  name                        = var.bucket_name
  location                    = var.location
  uniform_bucket_level_access = true
  force_destroy               = true

  labels = merge(
        var.labels,
        {
            purpose = "terraform"
        }
    )  
}