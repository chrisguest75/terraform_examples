# README

Demonstrate how to use workspaces

TOOO:

* Storing state in completely different locations/accounts

```sh
tfenv list     
tfenv list-remote
```

## Initialise

```sh
tfenv use 1.2.1

# initialise
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

## Tips

```sh
# Possible to use TF_WORKSPACE
export TF_WORKSPACE=dev
```

List the workspaces in a state

```sh
# TF_WORKSPACE applies here for selected workspace.  
terraform workspace list
```

## Investigate

Check the `terraform.tfstate.d` folder to see that there are individual state files for each workspace.  

## Resources

* [environment-variables](https://www.terraform.io/docs/cli/config/environment-variables.html)  
