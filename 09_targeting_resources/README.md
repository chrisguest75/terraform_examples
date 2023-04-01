# README

Demonstrate how to control plan and apply using targets  

NOTES:

* Taint is deprecated since 0.15.x and `terraform apply -replace resource.id` should be used now.  

## Terraform version

```sh
tfenv use
```

## Setup environment

```sh
# initialise
terraform init

# create containers
terraform apply -auto-approve

# docker containers
docker ps 

# test they are running
curl 0.0.0.0:8080  
curl 0.0.0.0:8081 
curl 0.0.0.0:8082 

# list the state
terraform state list

# nothing to do
terraform apply -auto-approve
```

## Using -replace

```sh
terraform apply -replace='docker_container.container["nginx2"]'
```

## Taint and Target

Start targetting and rebuilding containers  

```sh
# rebuild nginx2
terraform taint 'docker_container.container["nginx2"]'
terraform apply -auto-approve

# start time changes
docker ps 

# no changes
terraform taint 'docker_container.container["nginx2"]'
terraform plan --target 'docker_container.container["nginx1"]'
terraform apply -auto-approve

# destroy one 
terraform destroy --target 'docker_container.container["nginx1"]' -auto-approve
# rebuild it
terraform apply -auto-approve

# show outputs 
terraform output 
```

## Cleanup

```sh
# destroy all
terraform destroy -auto-approve
```

## Resources

* [kreuzwerker/terraform-provider-docker](https://github.com/kreuzwerker/terraform-provider-docker)  
* [hashicorp-terraform-0-12-preview-for-and-for-each](https://www.hashicorp.com/blog/hashicorp-terraform-0-12-preview-for-and-for-each)  
* [/kreuzwerker/docker/latest/docs](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)  
* Terraform Taint, Untaint, Replace – How to Use It (Examples) [here](https://spacelift.io/blog/terraform-taint)  
* Terraform Dynamic Blocks [here](https://brendanthompson.com/posts/2022/11/terraform-dynamic-blocks)  
