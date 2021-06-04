# README
Demonstrate how to upgrade terraform state to latest version

## Create
```sh
cd 11.x
terraform init

terraform plan 

# apply the plan
terraform apply -auto-approve

# print out the container id
terraform output
```


tfenv list-remote

tfenv use 0.15.5
tfenv use 0.14.11
tfenv use 0.13.7