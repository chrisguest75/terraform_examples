# README

Example of struturing Terraform for multiple accounts

TODO:

* add a json file to test CORS
* add cloudfront
* redirects to other domains

## NOTES

* Workspaces combine all the state into one file and this can be bad for flexibilty.  
* Multiple tfvars files for different accounts.  

## Prepare

```sh
. ./.env
aws --profile $AWS_PROFILE --region $AWS_REGION s3 ls
```

Create remote bucket for state - goto [./state_bucket/README.md](./state_bucket/README.md)  

## Create

```sh
# if cross account state
aws sts assume-role --role-arn "arn:aws:iam::xxxxxxxxxxxx:role/ops" --role-session-name "myname" --duration-seconds=3200

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=

# this requires that you have created the state bucket
terraform init -backend-config "bucket=terraform-state-bucket-toys" -backend-config "dynamodb_table=terraform-state-table-toys" -backend-config "region=eu-west-1" 

terraform plan --var-file=terraform.tfvars --var-file=terraform.website1.tfvars

terraform apply -auto-approve --var-file=terraform.tfvars --var-file=terraform.website1.tfvars

terraform output 

# this replaces the old one/
terraform plan --var-file=terraform.tfvars --var-file=terraform.website2.tfvars

terraform apply -auto-approve --var-file=terraform.tfvars --var-file=terraform.website2.tfvars


unset AWS_ACCESS_KEY_ID  
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN   
```

## Rediects

```sh
curl -vvv http://test-static-website-toys.s3-website-eu-west-1.amazonaws.com

curl -vvv http://test-static-website-toys.s3-website-eu-west-1.amazonaws.com/website_v1/index.html

curl -vvv http://test-static-website-toys.s3-website-eu-west-1.amazonaws.com/website_v2/index.html
```

## Cleanup

```sh
terraform destroy
```

## Resources

* hashicorp/terraform-provider-aws repo [here](https://github.com/hashicorp/terraform-provider-aws)  
* Initial setup of terraform backend using terraform [here](https://stackoverflow.com/questions/47913041/initial-setup-of-terraform-backend-using-terraform)
* Resource: aws_cloudfront_distribution [here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution)  
* IAM tutorial: Delegate access across AWS accounts using IAM roles [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html)  
* (Optional) Configuring a webpage redirect [here](https://docs.aws.amazon.com/AmazonS3/latest/userguide/how-to-page-redirect.html)  
