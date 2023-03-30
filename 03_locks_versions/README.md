# README

Demonstrate how to use locks and versions.  

## REASON

The reason we use lock files is so we can check versions do not change without validation and authorisation.  
The challenge of lock files is that we then have to manually upgrade each provider.  We normally benefit from the `~>X` version syntax to upgrade automatically in pipelines.
But upgrades cannot be filtered to specific providers.  Luckily upgrades also honour the version syntax, so we can keep non approved providers locked down whilst we automatically upgrade hashicorp ones.  

## Demonstrate

```sh
# init
terraform init

# lock all platforms
terraform providers lock -platform=darwin_amd64 -platform=darwin_arm64 -platform=linux_amd64

# plan
terraform plan
# apply it
terraform apply -auto-approve
```

## Upgrade Providers

Modify the version of the AWS provider.  

```hcl
# partial upgrade for 4.xx.xx releases
version = "~>4"
# a specific version
version = "4.60.0"
version = "4.56.0"
```

NOTES:

* Lock down to specific versions of non-hashicorp providers.  
* Allow partial upgrades using `~>X` syntax for hashicorp providers.  
* Always do `terraform init -upgrade` during CI/CD.  
* It seems that the upgrade doesn't match the platforms so `providers lock -platform=darwin_amd64 -platform=darwin_arm64 -platform=linux_amd64` is required.  

```sh
# init
terraform init -upgrade

# lock all platforms
terraform providers lock -platform=darwin_amd64 -platform=darwin_arm64 -platform=linux_amd64
```

## Resources

* Version Constraints [here](https://developer.hashicorp.com/terraform/language/expressions/version-constraints)  
