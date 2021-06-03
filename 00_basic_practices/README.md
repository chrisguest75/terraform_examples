# README
Demonstrate some basic practices for Terraform 

## Linting 
```sh
# format the code
terraform fmt -recursive  
```

## Generate documentation 
```sh
# install terraform docs
brew install terraform-docs

# create the docs
terraform-docs markdown ./modules/redis > ./modules/redis/README.md
```

# Resources
 

