# README
Demonstrate how to use different environment variables.

## Demonstrate overrides
```sh
terraform init
terraform plan

# override output path
export TF_VAR_out_path="./newfiles"

# override filename
terraform plan
export TF_VAR_out_filename="myfile200.txt"

# apply it
terraform apply -auto-approve
```


# Resources 
* Documentation [environment-variables](https://www.terraform.io/docs/cli/config/environment-variables.html)  

