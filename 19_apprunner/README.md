# README
Demonstrate apprunner service

TODO: 
* Pull a private image.  Role and policy.. 

## Create the service

```sh
terraform init
terraform plan
terraform apply -auto-approve

```

# Resources 
* [terraform-provider-aws](https://github.com/hashicorp/terraform-provider-aws)  
* [API_CreateService](https://docs.aws.amazon.com/apprunner/latest/api/API_CreateService.html)  
* Public ECR [ubuntu/nginx](https://gallery.ecr.aws/ubuntu/nginx)  
* [apprunner_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apprunner_service)  

