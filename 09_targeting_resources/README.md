# README
Demonstrate how to control plan and apply using targets

## Create
```sh
terraform init

terraform plan 

# apply the plan
terraform apply -auto-approve

# print out the container id
terraform output
```


terraform plan --target 'docker_container.container1'
terraform plan --target 'docker_container.container'

terraform taint.

