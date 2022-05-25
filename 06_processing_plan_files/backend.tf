terraform {
    required_version = "=1.2.1"

    backend "local" {
        path = "state/terraform.tfstate"
    }
}