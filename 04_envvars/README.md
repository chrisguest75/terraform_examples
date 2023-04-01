# README

Demonstrate how to use different environment variables.  

NOTES:

* If you have a `terraform.tfvars` file in the folder the env overrides do not seem to work.  

## Demonstrate overrides

```sh
# init
terraform init
# plan
terraform plan

# override output path
export TF_VAR_out_path="./newfiles"

# override filename
terraform plan
export TF_VAR_out_filename="myfile200.txt"

# apply it
terraform apply -auto-approve
```

## Resources

* Documentation [environment-variables](https://www.terraform.io/docs/cli/config/environment-variables.html)  
