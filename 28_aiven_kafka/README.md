# AIVEN KAFKA

Demonstrate how to use the terraform aiven provider.  

NOTES:

* Aiven provider is quite easy to use.
* Use the `avn` cli tool to find out possible options for parameters.  

## Prepare terraform environment

```sh
tfenv list     
tfenv list-remote
```

## Initialise

```sh
tfenv use

# initialise
terraform fmt
terraform validate
```

## Create

```sh
set -a
. ./.env
set +a

terraform plan --var-file=terraform.tfvars

terraform apply --var-file=terraform.tfvars --auto-approve 

terraform show -json | jq .

mkdir -p ./secrets/user
mkdir -p ./secrets/admin
terraform output -raw kafka_access_cert > ./secrets/admin/service.cert
terraform output -raw kafka_access_key > ./secrets/admin/service.key

terraform output -raw sample_topic_name
terraform output -raw kafka_a_access_cert > ./secrets/user/service.cert
terraform output -raw kafka_a_access_key > ./secrets/user/service.key
terraform output -raw kafka_service_uri 

# get the project ca-pem
avn project ca-get --target-filepath ./secrets/admin/ca.pem

```

## Parameters

```sh
avn user access-token create --description "terraform" --max-age-seconds 3600 --extend-when-used

# token list
avn user access-token list

avn service types
avn service plans --service-type kafka --cloud aws-eu-west-1

# versions of services that can be created
avn service versions     
```

## Troubleshooting

```sh
terraform console --var-file=terraform.tfvars
```

## Cleanup

```sh
terraform destroy --var-file=terraform.tfvars
```

## Resources

* https://github.com/aiven/aiven-examples/tree/main/terraform/kafka
* https://registry.terraform.io/providers/aiven/aiven/latest/docs
* aiven/terraform-provider-aiven repo [here](https://github.com/aiven/terraform-provider-aiven)  

https://docs.aiven.io/docs/tools/cli/service#avn-service-plan

https://github.com/aiven/terraform-provider-aiven/tree/main/sample_project
