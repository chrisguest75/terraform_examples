# README
Demonstrate compatibility with remote state versions

0.14.0 apparently introduced a state file format that retains backward compatibility.  This is so we can test this out.


```sh
tfenv list-remote
tfenv install 0.15.5
tfenv install 0.14.11
tfenv install 0.13.7
tfenv install 0.12.31
tfenv install 0.11.15
```


# create_remote_state
```sh
cd create_remote_state            
```
## Create 0.11.x
```sh
cd 11.x
tfenv use 0.11.15
terraform init
terraform plan 
terraform apply -auto-approve
```

## Create 0.12.x
```sh
cd ../12.x
tfenv use 0.12.31
code --diff ./main.tf ../11.x/main.tf  
terraform init
terraform plan 
terraform apply -auto-approve
```

## Create 0.13.x
```sh
cd ../13.x
tfenv use 0.13.7
code --diff ./main.tf ../12.x/main.tf  
terraform init
terraform plan 
terraform apply -auto-approve
```

## Create 0.14.x
```sh
cd ../14.x
tfenv use 0.14.11
code --diff ./main.tf ../13.x/main.tf  
terraform init
terraform plan 
terraform apply -auto-approve
```

## Create 0.15.x
```sh
cd ../15.x
tfenv use 0.15.5
code --diff ./main.tf ../14.x/main.tf  
terraform init
terraform plan 
terraform apply -auto-approve
```


# use_remote_state
```sh
cd ../../use_remote_state            
```
## Create 0.11.x
```sh
cd 11.x
tfenv use 0.11.15
terraform init
terraform plan 
terraform apply -auto-approve
cat ../files/11.x/rendered_myfile1.txt
```

## Create 0.12.x
```sh
cd ../12.x
tfenv use 0.12.31
code --diff ./main.tf ../11.x/main.tf  
terraform init

export TF_VAR_version_import=11.x  
terraform plan 
terraform apply -auto-approve
cat ../files/12.x/rendered_myfile1.txt

export TF_VAR_version_import=12.x  
terraform plan 
terraform apply -auto-approve
cat ../files/12.x/rendered_myfile1.txt

export TF_VAR_version_import=13.x  
terraform plan 
terraform apply -auto-approve
cat ../files/12.x/rendered_myfile1.txt

export TF_VAR_version_import=14.x  
terraform plan 
terraform apply -auto-approve
cat ../files/12.x/rendered_myfile1.txt

export TF_VAR_version_import=15.x  
terraform plan 
terraform apply -auto-approve
cat ../files/12.x/rendered_myfile1.txt
```


## Create 0.13.x
```sh
cd ../13.x
tfenv use 0.13.7
code --diff ./main.tf ../12.x/main.tf  
terraform init
terraform plan 
terraform apply -auto-approve
cat ../files/13.x/rendered_myfile1.txt
```

## Create 0.14.x
```sh
cd ../14.x
tfenv use 0.14.11
code --diff ./main.tf ../13.x/main.tf  
terraform init
terraform plan 
terraform apply -auto-approve
cat ../files/14.x/rendered_myfile1.txt
```

## Create 0.15.x
```sh
cd ../15.x
tfenv use 0.15.5
code --diff ./main.tf ../14.x/main.tf  
terraform init
terraform plan 
terraform apply -auto-approve
cat ../files/15.x/rendered_myfile1.txt
```