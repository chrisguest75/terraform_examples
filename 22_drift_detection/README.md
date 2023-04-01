# DRIFT DETECTION

Demonstrate some examples of how to use the `terraform refresh` to detect drift  

## Reason

The infrastructure state can differ to the stored state file.  If we only want to reconcile this difference and ignore the changes in terraform then we use -refresh.  


## Terraform version

```sh
tfenv use
```

## Setup environment

REF: Example is based on [09_targeting_resources/README.md](../09_targeting_resources/README.md)  

```sh
# initialise
terraform init

# create containers
terraform apply -auto-approve

# docker containers
docker ps 

# test they are running
curl 0.0.0.0:8080  
curl 0.0.0.0:8081 
curl 0.0.0.0:8082 

# list the state
terraform state list

# nothing to do
terraform apply -auto-approve

# get id for a container and kill it.
docker stop  
docker rm 
```

## Refresh

```sh
# this will detect the missing container.  
terraform plan -refresh-only

# if you now modify the terraform and plan again
# you'll see only the resources in state are modified.  
terraform plan -refresh-only

# now apply with refresh only to recreate the container.
terraform apply -refresh-only
```

## Cleanup

```sh
# destroy all
terraform destroy -auto-approve
```

## Resources

* Understand ‘terraform plan/apply -refresh-only’ (formerly ‘terraform refresh’) and fixing drift [here](https://medium.com/code-oil/understanding-terraform-plan-apply-refresh-only-the-myths-and-fixing-drift-5963207a1df8)  
* Terraform Dynamic Blocks [here](https://brendanthompson.com/posts/2022/11/terraform-dynamic-blocks)  
