terraform {
    required_version = "=0.12.30"

    backend "local" {
        path = "state/terraform.tfstate"
    }
}