
provider "aws" {
  region  = var.region
  profile = var.profile

  default_tags {
    tags = {
      "created_by"  = "terraform"
      "application" = "static-site"
      "owner"       = "chrisguest"
      "gitrepopath" = "17_static_site"
      "gitrepo"     = "https://github.com/chrisguest75/terraform_examples"
    }
  }
}