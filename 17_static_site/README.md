# README

Example of struturing Terraform for multiple accounts

## NOTES

* Workspaces combine all the state into one file and this can be bad for flexibilty.  
* Multiple tfvars files for different accounts. 

## Credentials


## Prepare

```sh
. ./.env
aws --profile $AWS_PROFILE --region $AWS_REGION s3 ls
```

Create remote bucket for state - goto [./state_bucket/README.md](./state_bucket/README.md)  

## Create

```sh
terraform init -backend-config "bucket=terraform-state-bucket-toys" -backend-config "dynamodb_table=terraform-state-table-toys" -backend-config "region=eu-west-1" 
terraform init
terraform plan --var-file=terraform.tfvars 
terraform apply -auto-approve --var-file=terraform.tfvars 

# this replaces the old one/
terraform plan --var-file=terraform.tfvars -var website_build_folder="website_v2" 
terraform apply -auto-approve --var-file=terraform.tfvars -var website_build_folder="website_v2" 

```


## Cleanup

```sh
terraform destroy
```


terraform fmt -recursive     

## Resources 
https://stackoverflow.com/questions/47913041/initial-setup-of-terraform-backend-using-terraform