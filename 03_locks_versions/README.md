# README

Demonstrate how to use locks and versions.  

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

```sh
# init
terraform init -upgrade

# lock all platforms
terraform providers lock -platform=darwin_amd64 -platform=darwin_arm64 -platform=linux_amd64
```

## Resources

* Version Constraints [here](https://developer.hashicorp.com/terraform/language/expressions/version-constraints)  
