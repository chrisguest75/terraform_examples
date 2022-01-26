# README
Demonstrate how to upgrade terraform state to latest version

```sh
tfenv list-remote
tfenv install 0.15.5
tfenv install 0.14.11
tfenv install 0.13.7
tfenv install 0.12.31
tfenv install 0.11.15
```

## Create 0.11.x
```sh
cd 11.x
tfenv use 0.11.15
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
```

## Create 0.12.x
```sh
cd ../12.x
tfenv use 0.12.31
code --diff ./main.tf ../11.x/main.tf  
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
```

## Create 0.13.x
```sh
cd ../13.x
tfenv use 0.13.7
code --diff ./main.tf ../12.x/main.tf  
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
```

## Create 0.14.x
```sh
cd ../14.x
tfenv use 0.14.11
code --diff ./main.tf ../13.x/main.tf  
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
```

## Create 0.15.x
```sh
cd ../15.x
tfenv use 0.15.5
code --diff ./main.tf ../14.x/main.tf  
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
```



