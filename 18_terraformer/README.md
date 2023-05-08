# README

Use terraformer to generate `hcl` resource files from deployed resources  

## Install

```sh
brew install terraformer
```

## Prepare

```sh
# prepare the provider
terraform init
```

## Generate

```sh
# list supported resources
terraformer import aws list       

# set environment
. ./.env

# Get help for aws provider
terraformer import aws --help

# export a cloudfront distribution from the profile and region
terraformer import aws --profile $AWS_PROFILE --regions $AWS_REGION -r cloudfront
```

## Resources

* Terraformer repo [here](https://github.com/GoogleCloudPlatform/terraformer)
