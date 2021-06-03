# README
Example of using remote state 

## Create a template text file 
```sh
cd create_template_file
terraform init -backend-config=backend.tfvars   

terraform plan --var-file=terraform.tfvars      
# apply the plan
terraform apply 
```
## Render the template file
Load state for file location and render template

```sh
cd ../render_template_file
terraform init -backend-config=backend.tfvars   

terraform plan --var-file=terraform.tfvars      
# apply the plan
terraform apply 
```

