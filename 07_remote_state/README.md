# README
Example of using remote state

## Work through processing example

```sh
cd create_template_file
terraform init -backend-config=backend.tfvars   

terraform plan --var-file=terraform.tfvars      
# apply the plan
terraform apply 
```

```sh
cd ../render_template_file
terraform init -backend-config=backend.tfvars   

terraform plan --var-file=terraform.tfvars      
# apply the plan
terraform apply 
```