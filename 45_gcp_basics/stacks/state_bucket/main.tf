

module bucket {
    source = "../../modules/bucket"

    bucket_name = var.state_bucket_name
    location = "EU"

    labels = var.labels
}