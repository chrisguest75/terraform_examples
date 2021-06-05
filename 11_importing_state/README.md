# README
Demonstrate how to import existing resources into state 

TODO: 
* import file and docker container.

## Create Container
```sh
terraform init
terraform plan
terraform apply -auto-approve
# remove state 
rm -rf .terraform
rm -rf state
# check container running
docker ps --filter "name=nginx1" --no-trunc 
```

## Import Image and Container
```sh
terraform init
terraform plan

# can't import image
terraform import docker_image.nginx "nginx:1.20.1"
# targetted plan
terraform apply --target "docker_image.nginx"  -auto-approve

# only a container to create
terraform plan

# import it
terraform import 'docker_container.container["nginx1"]' $(docker ps -aq --filter "name=nginx1" --no-trunc)

# container will be replaced because of env (provider issue)
terraform plan

terraform destroy -auto-approve

docker ps --filter "name=nginx1" --no-trunc 
```




# Resources 
* [kreuzwerker/terraform-provider-docker](https://github.com/kreuzwerker/terraform-provider-docker)  
* [/kreuzwerker/docker/latest/docs](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)  