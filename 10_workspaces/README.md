# README
Demonstrate how to use workspaces

```sh
tfenv list-remote
tfenv install 0.15.5
```

## Create 0.15.x
```sh
tfenv use 0.15.5
terraform init
terraform fmt
terraform validate
terraform plan 
terraform apply -auto-approve
```




