# README

Demonstrates a very basic module in Terraform.  

REF: [03_locks_versions/README.md](../03_locks_versions/README.md)  

## Create a docker container using a module

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

## Format and validate

```sh
terraform fmt ./modules/redis 
terraform validate ./modules/redis 
```

## Create the module documentation

```sh
# create module documentation
terraform-docs markdown ./modules/redis > ./modules/redis/README.md
```

## Resources

* [docker provider](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)  
* [docker-the-terraform-way](https://joachim8675309.medium.com/docker-the-terraform-way-a7c16b5f59ed)  

