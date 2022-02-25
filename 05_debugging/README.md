# README

Demonstrate how to troubleshoot problems

NOTE: Check you have no unexpected TF_VAR variables set that are overriding values.  

## Logging

```sh
terraform init

# all logs at debug
export TF_LOG=debug  
terraform plan
unset TF_LOG

# core logs only at debug
export TF_LOG_CORE=debug  
terraform plan
unset TF_LOG_CORE

# provider logs only at debug
export TF_LOG_PROVIDER=debug
terraform plan
unset TF_LOG_PROVIDER

terraform apply -auto-approve
```

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




## Resources

* Documentation [environment-variables](https://www.terraform.io/docs/cli/config/environment-variables.html)  

