# README

Demonstrate how to import data from ssm to data drive terraform.  

## Initialise

Create an SSM parameter that will be used as data in the Terraform.  

```sh
# modify the ./.env.template and dotsource it.
. ./.env

# find a value
aws --profile ${AWS_PROFILE} --region ${AWS_REGION} ssm describe-parameters | grep my-value

# set a value
aws --profile ${AWS_PROFILE} --region ${AWS_REGION} ssm put-parameter --name "/terraform/21_importing_ssm/version" --type String --value 6 --overwrite

# show values
aws --profile ${AWS_PROFILE} --region ${AWS_REGION} ssm get-parameter --name "/terraform/21_importing_ssm/version"
```

## Create

```sh
# set version
tfenv use

# init the providers
terraform init

# plan
terraform plan -var ssm_version_path="/terraform/21_importing_ssm/version"

# apply 
terraform apply -var ssm_version_path="/terraform/21_importing_ssm/version"
```

## Test

If the paramter does not exist `terraform plan` will fail.  

```sh
# plan
terraform plan -var ssm_version_path="/terraform/21_importing_ssm/doesnotexist"
```

## Resources

* hashicorp/terraform repo release 1.4.0 [here](https://github.com/hashicorp/terraform/releases/tag/v1.4.0)  
* Data Source: aws_ssm_parameter [here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter)  
