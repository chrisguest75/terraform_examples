# README

Quick example of using multiple providers.

NOTES:

* Multiple providers require aliases
* Use modules to pass in providers that apply to each region or pass provider to each object

## Create

```sh
terraform init

export AWS_PROFILE=myprofile
terraform plan 

terraform apply
```

## Resources

* hashicorp/terraform-provider-aws repo [here](https://github.com/hashicorp/terraform-provider-aws)  
* Terraform Provider Configuration [here](https://developer.hashicorp.com/terraform/language/providers/configuration)