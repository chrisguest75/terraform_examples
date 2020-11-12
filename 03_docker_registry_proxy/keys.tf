resource "aws_key_pair" "deployer" {
  key_name   = "chrisguest-ssh-key"
  public_key = var.ssh_public_key

  tags = merge(
    {
      "tf_resource" = format("%s", "deployer")
    },
    var.tags,
    var.repo_tags
  )
}
