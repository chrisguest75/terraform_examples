
data "terraform_remote_state" "create_template_file" {
  backend = "local"

  config = {
    path = "${path.module}/../create_template_file/state/create_template_file/terraform.tfstate"
  }
}

resource "local_file" "file" {
  content = templatefile(data.terraform_remote_state.create_template_file.outputs.filepath, { template_variable = "replace the variable" })
  #content     = "test"
  filename = var.path
}