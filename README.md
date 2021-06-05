# README 
A repo for Terraform examples 
[Terraform Docs](https://www.terraform.io/)

## Prereqs 

```sh
brew install tfenv
brew install jq
brew install terraform_landscape 
brew install terraform-docs
```

## TODO
*  lifecycle {
    ignore_changes = ["*"]
  }
* Data
* Keybase
* GCP 
* AWS
* Landscape
* Env variables
* TF_LOG 
* TF_ENV
* S3 bucket - deb repository
* security checking
* cost calculation
* OPA
* importing state
* targetting resources 
* secrets
* pull data from webservice. 
  * data sources
* aws provider default tags.
* drift detection
* versioned modules
https://github.com/ContainerSolutions/terraform-examples/tree/main/aws/aws_eks/fargate/spot_and_fargate
https://github.com/ContainerSolutions/terraform-examples
* dynamic 
* .13, .14, .15

## 00 - Basic Practices
Demonstrate some basic practices for Terraform  
[README.md](00_basic_practices/README.md)  

## 01 - s3_bucket
Example of creating an S3 Bucket  
[README.md](01_s3_bucket/README.md)  

## 02 - asg
Example of creating an Auto Scaling Group  
[README.md](02_asg/README.md)  

## 06 - processing_state_files 
Example of processing state files for CI/CD pipelines  
[README.md](06_processing_state_files/README.md)  

## 07 - remote_state
Example of using remote state  
[README.md](07_remote_state/README.md)

## 08 - modules
Example of writing and using a module  
[README.md](08_modules/README.md)

## 09 - targeting resources 
Demonstrate how to control plan and apply using targets   
[README.md](09_targeting_resources/README.md)

## 10 - workspaces
Demonstrate how to use workspaces
[README.md](10_workspaces/README.md)

## 12 - upgrading between versions
Demonstrate how to upgrade terraform state to latest version
[README.md](12_upgrading/README.md)

# Resources
* [terraform-tuesdays](https://github.com/ned1313/terraform-tuesdays)  
