# README

Demonstrate how to troubleshoot problems with Terraform  

NOTES:

* Check you have no unexpected TF_VAR variables set that are overriding values.  
* If need to upgrade change `.terraform-version` and `required_version = "=1.x.x"`  

## Logging

TF_LOG_CORE and TF_LOG_PROVIDER
TF_LOG  

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

## Graph

```sh
# show the graph of the state
terraform graph
```

## Console

```sh
terraform console
```

## Providers

```sh
terraform providers
```

## Outputs

```sh
terraform outputs
```

## Show state

```sh
terraform state list
```

## Resources

* Documentation [environment-variables](https://www.terraform.io/docs/cli/config/environment-variables.html)  

