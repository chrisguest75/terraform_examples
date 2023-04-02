# README

Demonstrates using a module in a subdirectory from a commitid  

REF: [08_module/README.md](../08_module/README.md)  

TODO:

* Is there a way of iterating instances of modules. If so his would help exporting outputs.  

## Demonstrates

* Referencing a module from a commitid and path into repo
* Using module a number of times

## Use a module from github

```sh
terraform init
terraform plan 

# apply the plan
terraform apply -auto-approve

# print out the container id
terraform output

# list the objects
terraform state
```

## Investigating state

```sh
terraform console
```

## Resources

* Module Sources [here](https://developer.hashicorp.com/terraform/language/modules/sources#github)  
