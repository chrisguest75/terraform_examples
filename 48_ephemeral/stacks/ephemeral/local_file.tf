ephemeral "random_password" "db_password" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

locals {
  credentials = jsondecode(ephemeral.random_password.db_password.result)
}

resource "local_file" "file" {
  # this will not work because content cannot be set as ephemeral
  # Ephemeral values are not valid for "content", because it is not a write-only attribute and must be persisted to state.
  content  = local.credentials
  filename = "./tmp.txt"
}
