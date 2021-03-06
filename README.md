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
* Keybase
* GCP 
* AWS
* Landscape
* TF_LOG, TF_ENV, CORE and PROVIDER logging
* S3 bucket - deb repository
* security checking
* cost calculation
* OPA
* secrets
* aws provider default tags.
* drift detection
* versioned modules
https://github.com/ContainerSolutions/terraform-examples/tree/main/aws/aws_eks/fargate/spot_and_fargate
https://github.com/ContainerSolutions/terraform-examples
* dynamic 
* cdktf - https://learn.hashicorp.com/tutorials/terraform/cdktf-build?in=terraform/cdktf
* testing

Examples:
* Create a resource using for-each.  Migrate state over to a new reource and remove entry from for-each.


## 00 - Basic Practices
Demonstrate some basic practices for Terraform  
[README.md](00_basic_practices/README.md)  

## 01 - S3 bucket
Example of creating an S3 Bucket  
[README.md](01_s3_bucket/README.md)  

## 02 - asg
Example of creating an Auto Scaling Group  
[README.md](02_asg/README.md)  

## 06 - processing state files 
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

## 11 - importing state
Demonstrate how to import existing resources into state  
[README.md](11_importing_state/README.md)  

## 12 - upgrading between versions
Demonstrate how to upgrade terraform state to latest version  
[README.md](12_upgrading/README.md)  

## 13 - importing data (json + local_file)
Demonstrate how to import data from different places  
[README.md](13_importing_data/README.md)  

## 15 - importing data (json + webservice)
Demonstrate how to import data from a webservice  
[README.md](15_importing_webservice/README.md) 

# Resources
* Github [hashicorp/terraform](https://github.com/hashicorp/terraform)  
  * Release notes [tags](https://github.com/hashicorp/terraform/tags)  
* Examples [terraform-tuesdays](https://github.com/ned1313/terraform-tuesdays)  
* Examples [antonbabenko repos](https://github.com/antonbabenko?tab=repositories)  
* [awesome-terraform](https://github.com/antonbabenko/awesome-terraform)  
* Offical [tutorials/terraform](https://learn.hashicorp.com/tutorials/terraform)  


# Providers 
* [terraform-provider-aws](https://github.com/hashicorp/terraform-provider-aws)  