# README
Example of writing and using a module

## Create a docker container using a module
```sh
terraform init

terraform plan 

# apply the plan
terraform apply -auto-approve

# print out the container id
terraform output
```

## Create the module documentation
```sh
# create module documentation
terraform-docs markdown ./modules/redis > ./modules/redis/README.md
```


# Resources
* [docker provider](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)  
* [docker-the-terraform-way](https://joachim8675309.medium.com/docker-the-terraform-way-a7c16b5f59ed)  

