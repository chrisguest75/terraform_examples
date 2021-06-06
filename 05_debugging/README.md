# README
Demonstrate how to troubleshoot problems

NOTE: Check you have no unexpected TF_VAR variables set that are overriding values. 

## Create 
TF_LOG_CORE and TF_LOG_PROVIDER
TF_LOG

terraform console
terraform graph

```sh
terraform init
terraform plan

export TF_LOG_PROVIDER=debug     
terraform apply -auto-approve
```

* TF_LOG, TF_ENV, CORE and PROVIDER logging




# Resources 
* Documentation [environment-variables](https://www.terraform.io/docs/cli/config/environment-variables.html)  
