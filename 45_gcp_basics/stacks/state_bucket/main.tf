

module bucket {
    source = "../../modules/bucket"

    bucket_name = "${var.project_id}-tf-state"
    location = "EU"
}