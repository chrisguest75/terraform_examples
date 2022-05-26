# README

Demonstrate how to upgrade terraform state to latest version

Works by writing a state file to a parent directory and then using this as a state file as we go through versions.  

## Installation of new versions

```sh
# list installed builds
tfenv list

# list remote installs 
tfenv list-remote

# install a version
tfenv install 0.11.15

# find TF_ vars
env | grep "TF.*="     
```

## Create 0.11.x

```sh
cd 11.x
tfenv install 0.11.15
tfenv use 0.11.15
terraform version
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
cp ../state/terraform.tfstate ../state/terraform.tfstate.11x 
```

## Create 0.12.x

```sh
cd ../12.x
tfenv install 0.12.31
tfenv use 0.12.31
terraform version
code --diff ./main.tf ../11.x/main.tf  
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
cp ../state/terraform.tfstate ../state/terraform.tfstate.12x 
```

## Create 0.13.x

```sh
cd ../13.x
tfenv install 0.13.7
tfenv use 0.13.7
terraform version
code --diff ./main.tf ../12.x/main.tf  
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
cp ../state/terraform.tfstate ../state/terraform.tfstate.13x 
```

## Create 0.14.x

```sh
cd ../14.x
tfenv install 0.14.11
tfenv use 0.14.11
terraform version
code --diff ./main.tf ../13.x/main.tf  
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
cp ../state/terraform.tfstate ../state/terraform.tfstate.14x 
```

## Create 0.15.x

```sh
cd ../15.x
tfenv install 0.15.5
tfenv use 0.15.5
terraform version
code --diff ./main.tf ../14.x/main.tf  
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
cp ../state/terraform.tfstate ../state/terraform.tfstate.15x 
```

## Create 1.2.x

```sh
cd ../1.2.x
tfenv install 1.2.1
tfenv use 1.2.1
terraform version
code --diff ./main.tf ../15.x/main.tf  
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
cp ../state/terraform.tfstate ../state/terraform.tfstate.1.2.x 
```

## Cleanup

```sh
terraform destroy -auto-approve
```

## Diff the state files

Now you can diff the backed up state files to see how they change.  
