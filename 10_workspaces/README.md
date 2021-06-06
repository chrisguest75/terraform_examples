# README
Demonstrate how to use workspaces

TOOO:
* Storing state in completely different locations/accounts

```sh
tfenv list-remote
tfenv install 0.15.5
```

## Initialise
```sh
tfenv use 0.15.5
terraform init
terraform fmt
terraform validate
```

## Apply Dev 
```sh
export WORKSPACE=dev  
terraform workspace new ${WORKSPACE} 
terraform workspace select ${WORKSPACE}        
terraform plan --var-file=terraform.${WORKSPACE}.tfvars 
terraform apply -auto-approve --var-file=terraform.${WORKSPACE}.tfvars 
```


## Apply Staging 
```sh
export WORKSPACE=staging
terraform workspace new ${WORKSPACE} 
terraform workspace select ${WORKSPACE}        
terraform plan --var-file=terraform.${WORKSPACE}.tfvars 
terraform apply -auto-approve --var-file=terraform.${WORKSPACE}.tfvars 
```
     
## Apply Prod 
```sh
export WORKSPACE=prod
terraform workspace new ${WORKSPACE} 
terraform workspace select ${WORKSPACE}        
terraform plan --var-file=terraform.${WORKSPACE}.tfvars 
terraform apply -auto-approve --var-file=terraform.${WORKSPACE}.tfvars 
```

## Possible to use TF_WORKSPACE
```sh
export TF_WORKSPACE=dev
```

# Resources
* [environment-variables](https://www.terraform.io/docs/cli/config/environment-variables.html)  
