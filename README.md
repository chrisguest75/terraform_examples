# README 
A repo for Terraform examples 
[Terraform Docs](https://www.terraform.io/)

## Prereqs 

```sh
brew install tfenv
brew install jq
brew install terraform_landscape 
```

## Notes

1. We use allowed_account_ids to restrict the accounts the TF can be applied.


## TODO
*  lifecycle {
    ignore_changes = ["*"]
  }
* Modules
* Data
* Keybase
* GCP 
* AWS
* Landscape
* Outputs
* Docker
* Env variables
* TF_LOG 
* TF_ENV
* Kapitan

## 01_s3_bucket
Example of creating an S3 Bucket
[README.md](01_s3_bucket/README.md)

## 02_asg
Example of creating an Auto Scaling Group 
[README.md](02_asg/README.md)

## 03_docker_registry_proxy
Example 
[README.md](03_docker_registry_proxy/README.md)

## Pre-commit hook (process terraform fmt)
Install the pre-commit hook.  
```sh
# hardlink the script 
ln ./hooks/pre-commit .git/hooks/pre-commit  
```