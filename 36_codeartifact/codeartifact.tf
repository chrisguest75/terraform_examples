resource "aws_codeartifact_domain" "domain" {
  domain         = "chrisguest-node-packages"
}

resource "aws_codeartifact_repository" "test" {
  repository = "chrisguest-node-packages"
  domain     = aws_codeartifact_domain.domain.domain
  
}