# README
Example of processing state files for CI/CD pipelines 

TODO:
* Make a decision based on changes. 
    * No changes
    * No object destruction
    * Tags all allowed.
## Work through processing example

```sh
# init the .terraform directory
terraform init        

# create a binary plan
terraform plan --out plan.tfplan 

# echo out the plan
terraform show plan.tfplan 

# convert plan to json
terraform show --json ./plan.tfplan | jq 

# apply the plan
terraform apply plan.tfplan
```

Now with empty plans
```sh
# should be nothing to plan
terraform plan --out plan2.tfplan

# echo out the empty plan
terraform show plan2.tfplan 

# convert empty plan to json
terraform show --json ./plan2.tfplan | jq 

```

## Compare the plans    
```sh
terraform show --json ./plan.tfplan | jq > ./plan.tfplan.json
terraform show --json ./plan2.tfplan | jq > ./plan2.tfplan.json           
```


terraform plan --out tfplan2.binary 
terraform show tfplan2.binary   
terraform show --json ./tfplan2.binary | jq 

