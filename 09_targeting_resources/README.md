# README
Demonstrate how to control plan and apply using targets
## Taint and Target
```sh
terraform init

terraform apply -auto-approve

curl 0.0.0.0:8080  
curl 0.0.0.0:8081 
curl 0.0.0.0:8082 

terraform state list        

# nothing to do
terraform apply -auto-approve

# rebuild nginx2
terraform taint 'docker_container.container["nginx2"]'
terraform apply -auto-approve

# no changes
terraform taint 'docker_container.container["nginx2"]'
terraform plan --target 'docker_container.container["nginx1"]'
terraform apply -auto-approve


# destroy one 
terraform destroy --target 'docker_container.container["nginx1"]' -auto-approve
# rebuild it
terraform apply -auto-approve

terraform output 

# destroy all
terraform destroy -auto-approve
```

# Resources 
* [kreuzwerker/terraform-provider-docker](https://github.com/kreuzwerker/terraform-provider-docker)  
* [hashicorp-terraform-0-12-preview-for-and-for-each](https://www.hashicorp.com/blog/hashicorp-terraform-0-12-preview-for-and-for-each)  
* [/kreuzwerker/docker/latest/docs](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)  