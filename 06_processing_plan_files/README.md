# README

Example of processing plan files for CI/CD pipelines  

Make a decisions based on changes.  

* No changes
* No object destruction

TODO:  

* Some actions are compound `"actions": ["delete","create"],` check the conditional file.  

## Initialise

```sh
mkdir -p ./plans

# init the .terraform directory
terraform init
```

## Initial create

```sh
# create a binary plan
terraform plan --out ./plans/plan_create.tfplan 

# echo out the plan
terraform show ./plans/plan_create.tfplan 

# convert plan to json
terraform show --json ./plans/plan_create.tfplan | jq 

# apply the plan
terraform apply ./plans/plan_create.tfplan
```

## Nothing to do

```sh
# should be nothing to plan
terraform plan --out ./plans/plan_nothing.tfplan

# echo out the empty plan
terraform show ./plans/plan_nothing.tfplan 

# convert empty plan to json
terraform show --json ./plans/plan_nothing.tfplan | jq 
```

## Now with add extra resources plans  

```sh
# should be nothing to plan
terraform plan -var-file=./terraform_more_files.tfvars --out ./plans/plan_more_resources.tfplan

# echo out the empty plan
terraform show ./plans/plan_more_resources.tfplan 

# convert empty plan to json
terraform show --json ./plans/plan_more_resources.tfplan | jq 

# apply the plan
terraform apply ./plans/plan_more_resources.tfplan
```

## Destroy plans  

```sh
# should be nothing to plan
terraform plan -var-file=./terraform_destroy.tfvars --out ./plans/plan_destroy.tfplan

# echo out the empty plan
terraform show ./plans/plan_destroy.tfplan 

# convert empty plan to json
terraform show --json ./plans/plan_destroy.tfplan | jq 
```

## Compare the plans

```sh
# save plans as json
terraform show --json ./plans/plan_create.tfplan | jq > ./plans/plan_create.tfplan.json
terraform show --json ./plans/plan_nothing.tfplan | jq > ./plans/plan_nothing.tfplan.json    
terraform show --json ./plans/plan_more_resources.tfplan | jq > ./plans/plan_more_resources.tfplan.json    
terraform show --json ./plans/plan_destroy.tfplan | jq > ./plans/plan_destroy.tfplan.json      
```

## Decisions

```sh
# Show the list of actions
for filename in ./plans/*.tfplan.json; 
do
  echo "$filename"
  jq -r '.resource_changes[].change.actions[]' "$filename"
done
```

```sh
# aggregate the actions in the plan
for filename in ./plans/*.tfplan.json; 
do
  jq --arg filename "${filename}" -r '. | [ .resource_changes[].change.actions[] ] | group_by(.) | map({(.[0]):length}) | reduce .[] as $x (null; . + $x) | . + {file:$filename }' "$filename"
done
```

Example output of the aggregated data  

```json
{
  "create": 8,
  "delete": 2,
  "no-op": 3,
  "file": "./plans/plan_more_resources.tfplan.json"
}
```

```sh
# add a condition for plans containing deletes
for filename in ./plans/*.tfplan.json; 
do
  jq --arg filename "${filename}" -e -r '. | [ .resource_changes[].change.actions[] ] | group_by(.) | map({(.[0]):length}) | reduce .[] as $x (null; . + $x) | . + {file:$filename } | select(.delete > 0)' "$filename"
  exitcode=$?
  if [[ $exitcode != 0 ]];then
    # if don't find delete jq will error
    echo "Allow '${filename}' without manual verification"
  else
    echo "'${filename}' requires manual verification (delete found)"
  fi
done
```

## Resources

* My `jq` examples [here](https://github.com/chrisguest75/shell_examples/tree/master/32_jq)  


