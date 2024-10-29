# README

Demonstrates how to use moved block.  

## Demonstrates

* Show moving state with a moved block.  

## Create initial state

```sh
just init
just plan 

# apply the plan
just apply -auto-approve

# list the objects
terraform state list
```

## Investigating state

```sh
# NOTE: Is there a way of examining the current state through this?
terraform console

terraform state list
```

EDIT: Go edit the `main.tf` to include the moved block and the renamed resources.  

```sh
just plan 
just apply -auto-approve

# resources will still exist but will be moved
# also check the state only refers to new_files
terraform state list 
```

## Resources

* Moved [here](https://developer.hashicorp.com/terraform/language/modules/develop/refactoring)  
* Terraform Moved Block [here](https://brendanthompson.com/posts/2022/12/terraform-moved-block)