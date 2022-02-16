terraform {
  required_version = "=1.1.5"

  required_providers {
    sops = {
      source = "carlpett/sops"
      version = "~> 0.5"
    }
  }

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

data "sops_file" "my_secrets" {
  source_file = "my_secrets.enc.json"
}

output "secret1" {
  sensitive = true
  value = data.sops_file.my_secrets.data["passwords.secret1"]
}

output "secret2" {
  sensitive = true
  value = data.sops_file.my_secrets.data["passwords.secret2"]
}

output "secret2json" {
  sensitive = true
  # Access the password variable that is under db via the terraform object
  value = jsondecode(data.sops_file.my_secrets.raw).passwords.secret2
}
