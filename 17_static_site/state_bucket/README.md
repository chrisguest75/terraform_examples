# README

Create a state bucket that can be used for the example

## Prepare

```sh
. ./.env
aws --profile $AWS_PROFILE --region $AWS_REGION s3 ls
```

## Create

```sh
terraform init
terraform plan --var-file=terraform.tfvars 
terraform apply -auto-approve --var-file=terraform.tfvars 
```

## Cleanup

```sh
terraform destroy
```

## Before committing

```sh
# format the code to have correct tabbing
terraform fmt -recursive
```

## Resources

* Examples of creating state bucket with terraform [here](https://stackoverflow.com/questions/47913041/initial-setup-of-terraform-backend-using-terraform)
